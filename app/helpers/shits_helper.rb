#encoding: utf-8
module ShitsHelper
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
  
  def few_synonyms_span
    content_tag(:span, :class => 'few-synonyms-span') do
      'мало синонимов'
    end
  end
end
