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

  def options_for_video_reviews(selected=nil)
    options_for_select((1..5).map { |num| [pluralize(num, 'Star'), num] }, selected)
  end
end
