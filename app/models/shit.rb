class Shit < ActiveRecord::Base
  
  def self.shit_by_name(name)
    if !name.blank?    
      name_to_store = name.mb_chars.upcase.strip
      shit = self.find_or_initialize_by_name(name_to_store)
      shit.vote
    end
  end
  
  def capitalized_name
    self.name.mb_chars.capitalize
  end
  
  def self.shit_by_id(id)
    if !id.blank?
      shit = self.find(id)
      shit.vote
    end
  end
  
  def vote
    self.total = self.total + 1
    self.save
    self
  end
end
