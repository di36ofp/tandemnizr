module ApplicationHelper

  def flash_message
    flash.map do | key, msg |
      build_box key, msg
    end.join.html_safe
  end


  def select_language
    common_languages = []
    LanguageList::COMMON_LANGUAGES.each do | language |
      common_languages << [language.name, language.iso_639_1]
    end
    common_languages
  end

  def iso_language(language)
    lang = LanguageList::LanguageInfo.find(language)
    lang.name.inspect.gsub! /"/, ''
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
