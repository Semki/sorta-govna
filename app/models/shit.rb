class Shit < ActiveRecord::Base
  
  def self.shit_by_name(name)
    self.find_or_initialize_by_name(name.mb_chars.upcase.strip).vote unless name.blank?      
  end
  
  def capitalized_name
    self.name.mb_chars.capitalize
  end
  
  def self.shit_by_id(id)    
    self.find(id).vote unless id.blank?      
  end
  
  def vote
    self.total = self.total + 1
    self.save
    self
  end
end
