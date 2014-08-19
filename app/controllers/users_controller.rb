class UsersController < ApplicationController
  before_filter :require_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
     charge_card
     if params[:invitation_token].present?
       handle_invitation
     end
    else
      flash[:error] = 'Invalid user information.  Please check the errors below.'
      render :new
    end
  end

  def charge_card
    charge =  StripeWrapper::Charge.create(
      :amount => 995,
      :card => params[:stripeToken],
      :description => "Sign up charge for #{@user.email}"
    )

    if charge.successful?
      @user.save!
      AppMailer.send_welcome_email(@user).deliver
      flash[:notice] = 'Thank you for registering with MyFlix. Please sign in now.'
      redirect_to sign_in_path
    else
      flash[:error] = charge.error_message
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new_with_invitation_token
    invitation = Invitation.where(token: params[:token]).first
    if invitation
      @user             = User.new(email: invitation.recipient_email)
      @invitation_token = invitation.token
      render :new
    else
      redirect_to expired_token_path
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :full_name, :password)
  end

  def handle_invitation
    invitation = Invitation.where(token: params[:invitation_token]).first
    @user.follow(invitation.inviter)
    invitation.inviter.follow(@user)
    invitation.update_column(:token, nil)
  end
end
