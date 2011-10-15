#encoding: utf-8
class Shit < ActiveRecord::Base
  has_many :synonyms  
  has_many :timelines
  validates :name, :presence => true
  before_create :create_main_synonym
  
  scope :topshit, lambda{|top| order("total desc").limit(top)}
  
  def self.with_names(names)
    shits = Array.new
    names.each do |name|
      shit = find_or_initialize_by_name(name.mb_chars.upcase.strip)
      shits << shit unless shit.nil?
    end
    shits
  end
  
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
    Timeline.add_new_timeline_item(self)
    self
  end

  def update_shit_name
    self.name = Synonym.select('name').where('shit_id = ?', self.id).order('relevance desc').limit(1).first.name
    self.save
  end
  
  private
  
  def create_main_synonym
    synonym = Synonym.new(:name=>name, :relevance=>4)
    synonyms << synonym
  end
  
  
end
