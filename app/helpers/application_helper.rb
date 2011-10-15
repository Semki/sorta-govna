# coding: utf-8
module ApplicationHelper
  
  def name_with_synonyms(shit)
    unless shit.nil?
      synonyms_string = shit.synonyms.collect{ |s| s.name }.reject{ |name| name == shit.name }.join(', ')
      if synonyms_string.present?
        t(:name_aka_synonyms, :name => shit.name, :synonyms => synonyms_string)
      else
        shit.name
      end
    end
  end

  def switch_language_link
    return (link_to 'English', url_for(:locale => :en)) if I18n.locale == :ru
    link_to 'Русский', url_for(:locale => nil)
  end
  
  def base_title
    t(:sortagovna)
  end
  
  def title
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
