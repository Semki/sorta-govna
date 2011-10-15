#encoding: utf-8
module ShitsHelper
  def few_synonyms_span
    content_tag(:span, :class => 'few-synonyms-span') do
      'мало синонимов'
    end
  end
end
