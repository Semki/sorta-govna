class Shit < ActiveRecord::Base
  def self.shit_by_name(name)
    if name != ''
      name_to_store = name.mb_chars.upcase.strip
      shit = self.find_by_name(name_to_store)
      if (shit.nil?)
        shit = self.new
        shit.name = name_to_store
        shit.total = 0      
      end
      shit.total += 1
      shit.save
      shit
    end
  end
  
  def self.shit_by_id(id)
    if id != ''
      shit = self.find(id)
      shit.total = shit.total + 1
      shit.save
      shit
    end
  end
end
