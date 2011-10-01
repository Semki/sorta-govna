module SynonymsHelper
  def concept_in_list(shit)
    "#{shit.name} (id #{shit.id})" unless shit.nil?
  end
end
