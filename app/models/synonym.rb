# coding: utf-8
class Synonym < ActiveRecord::Base
  belongs_to :shit
  after_create :update_shit_name
  after_update :update_shit_name
  after_destroy :update_shit_name

  validates :name, :presence => true, uniqueness: {scope: :shit_id}
  validates :shit_id, :presence => true, :numericality => true
  validates :relevance, :presence => true, :numericality => {:greater_than => 0, :less_than_or_equal_to => 4}
  scope :autocomplete_scope, order("relevance desc")

  def description
    "#{name} #{ '(' + shit.name + ')' unless relevant_enough? } — #{shit.description}"
  end

  def relevant_enough?
    relevance >= 3
  end

  private

  # Обновление имени концепта. Вычисляется наиболее релевантный синоним
  def update_shit_name
    self.shit.update_shit_name
  end
end
