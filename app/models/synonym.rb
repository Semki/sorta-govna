class Synonym < ActiveRecord::Base
  belongs_to :shit
  
  
  def description
    self.shit.description
  end
end
