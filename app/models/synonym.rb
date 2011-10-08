# coding: utf-8
class Synonym < ActiveRecord::Base
  belongs_to :shit
  after_create :update_concept_name
  after_update :update_concept_name

  validates :name, :presence => true
  validates :shit_id, :presence => true, :numericality => true
  validates :relevance, :presence => true, :numericality => {:greater_than => 0, :less_than_or_equal_to => 4}
  validate :has_no_doublicate
  scope :autocomplete_scope, order("relevance desc")
  
  
  def description
    "#{name} #{ '(' + shit.name + ')' unless relevant_enough? } — #{shit.description}"
  end
  
  def relevant_enough?
    relevance >= 3
  end
  
  # валидация по наличию дубликата. Дубликатом считаем синоним с таким же именем и концептом.
  def has_no_doublicate
    is_empty = Synonym.where("shit_id = ? and name = ? ", shit_id, name).limit(1).empty?
    # уже есть синоним с таким именем и концептом!
    errors.add(:shit_id, "We have the same synonym!!!") unless is_empty
  end
  
  private

  # Обновление имени концепта. Вычисляется наиболее релевантный синоним
  def update_concept_name
    self.shit.update_shit_name
  end
end
