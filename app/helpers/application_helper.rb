# coding: utf-8
module ApplicationHelper

  def switch_language_link
    return (link_to 'English', url_for(:locale => :en)) if I18n.locale == :ru
    link_to 'Русский', url_for(:locale => nil)
  end  
end
