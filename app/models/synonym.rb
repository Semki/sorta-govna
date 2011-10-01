class Synonym < ActiveRecord::Base
  belongs_to :shit
  
  def description
    "#{self.name} #{('(' + self.shit.name + ')') if self.name!=self.shit.name} - #{self.shit.description}"
  end
end
