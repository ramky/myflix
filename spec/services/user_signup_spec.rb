require 'spec_helper'

describe UserSignup do
  describe "#sign_up" do
    context "valid personal info and valid card" do
      let(:charge) { double(:charge, successful?: true) }
      before do
        StripeWrapper::Charge.stub(:create).and_return(charge)
      end
      after { ActionMailer::Base.deliveries.clear }

      it "creates the user" do
        UserSignup.new(Fabricate.build(:user)).sign_up(
          "some_stripe_token", nil)
        expect(User.count).to eq(1)
      end

      it "makes the user follow the inviter" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation,
                               inviter: alice,
                               recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user,
                                       email: 'joe@example.com',
                                       password: 'password',
                                       full_name: 'Joe Doe'
                                      )).sign_up("some_stripe_token",
                                                 invitation.token)
        joe = User.where(email: 'joe@example.com').first
        expect(joe.follows?(alice)).to be_true
      end

      it "makes the inviter follow the user" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation,
                               inviter: alice,
                               recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user,
                                       email: 'joe@example.com',
                                       password: 'password',
                                       full_name: 'Joe Doe'
                                      )).sign_up("some_stripe_token",
                                                 invitation.token)
        joe = User.where(email: 'joe@example.com').first
        expect(alice.follows?(joe)).to be_true
      end

      it "expires the invitation upon acceptance" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation,
                               inviter: alice,
                               recipient_email: 'joe@example.com')
        UserSignup.new(Fabricate.build(:user,
                                       email: 'joe@example.com',
                                       password: 'password',
                                       full_name: 'Joe Doe'
                                      )).sign_up("some_stripe_token",
                                                 invitation.token)
        expect(Invitation.first.token).to be_nil
      end

      it "sends out email to the user with valid inputs" do
        UserSignup.new(Fabricate.build(:user,
                                       email: 'joe@example.com')).sign_up(
                                         "some_stripe_token", nil)
        expect(ActionMailer::Base.deliveries.last.to).to eq(['joe@example.com'])
      end

      it "sends out email containing the user's name with valid inputs" do
        UserSignup.new(Fabricate.build(:user,
                                       full_name: 'Joe Smith',
                                       email: 'joe@example.com')).sign_up(
                                         "some_stripe_token", nil)
        expect(ActionMailer::Base.deliveries.last.body).to include('Joe Smith')
      end
    end

    context "valid personal info and declined card" do
      let(:charge) { double(:charge,
                            successful?: false,
                            error_message: 'Your card was declined') }
      before do
        StripeWrapper::Charge.stub(:create).and_return(charge)
      end
      it "does not create a new user record" do
        UserSignup.new(Fabricate.build(:user)).sign_up('1234', nil)
        expect(User.count).to eq(0)
      end
    end

    context "invalid personal info" do
      before do
        UserSignup.new(User.new(email: 'ram@example.com')).sign_up('1234', nil)
      end

      it "does not create the user" do
        expect(User.count).to eq(0)
      end

      it "does not charge the card" do
        StripeWrapper::Charge.should_not_receive(:create)
      end

      it "does not send an email with invalid inputs" do
        expect(ActionMailer::Base.deliveries).to be_empty
      end
    end
  end
end
