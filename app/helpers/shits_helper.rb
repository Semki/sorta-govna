#encoding: utf-8
module ShitsHelper
  def name_with_synonyms(shit)
    unless shit.nil?
      synonyms_string = shit.synonyms.collect{ |s| s.name }.reject{ |name| name == shit.name }.join(', ')
      unless synonyms_string.blank?
        t(:name_aka_synonyms, :name => shit.capitalized_name, :synonyms => synonyms_string)
      else
        shit.capitalized_name
      end
    end
  end
end
