class Synonym < ActiveRecord::Base
  belongs_to :shit
  validates :name, :presence => true
  validates :shit_id, :presence => true, :numericality => true
end
