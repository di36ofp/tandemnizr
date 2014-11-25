module ApplicationHelper

  def flash_message
    flash.map do | key, msg |
      build_box key, msg
    end.join.html_safe
  end


  def select_language
    language_array = ([['French', 1], ['Spanish', 2], ['English', 3], ['German', 4], ['Russian', 5], ['Danish', 6], ['Chiness', 7], ['Portuguese', 8], ['Korean', 9], ['Mandarin', 10], ['Japanese', 11], ['Italian', 12], ['Turkish', 13], ['Vietnamese', 14], ['Hindi', 15]])

    language_array.map do|language|
      [ language[0], language[0]]
    end
  end

  def user_nav_link
    if current_user.nil?
      render 'shared/user_links_not_loged'
    else
      render 'shared/user_links_loged_in'
    end
  end

  private

  def build_box key, msg
    content_tag :div, :data => {:alert => ''}, :class => "alert-box #{key}" do
      concat(msg )+
      concat(content_tag :a, "×",:class => 'close', :escape => true)
    end
  end
end
