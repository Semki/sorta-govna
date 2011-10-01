class Synonym < ActiveRecord::Base
  belongs_to :shit

  validates :name, :presence => true
  validates :shit_id, :presence => true, :numericality => true
  
  def description
    "#{self.name} #{('(' + self.shit.name + ')') if self.name!=self.shit.name} - #{self.shit.description}"
  end

end
