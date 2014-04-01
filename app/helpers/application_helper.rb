module ApplicationHelper
  def twitterized_type(type)
    case type
    when :alert
      "alert-block"
    when :error
      "alert-danger"
    when :notice
      "alert-info"
    when :success
      "alert-success"
    else
      type.to_s
    end
  end
end
