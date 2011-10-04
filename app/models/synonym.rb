# coding: utf-8
class Synonym < ActiveRecord::Base
  belongs_to :shit

  validates :name, :presence => true
  validates :shit_id, :presence => true, :numericality => true
  validates :relevance, :presence => true, :numericality => {:greater_than => 0, :less_than_or_equal_to => 4}
  
  scope :autocomplete_scope, order("relevance desc")
  
  
  def description
    "#{name} #{ '(' + shit.name + ')' unless relevant_enough? } — #{shit.description}"
  end
  
  def relevant_enough?
    relevance >= 3
  end
end
