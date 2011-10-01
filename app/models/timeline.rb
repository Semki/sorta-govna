class Timeline < ActiveRecord::Base
  belongs_to :shit
  
  def self.add_new_timeline_item(shit)
    date = Date.today
    item = find_shit_in_timeline(shit, date)
    item = Timeline.create_timeline_item(shit, date) if @timelineitem.nil?
    item.inc_total
  end

  def self.create_timeline_item(shit, date)
    # Self.create(:shit => shit, :date => date )
    item = Timeline.new
    item.shit = shit
    item.date = date
    item.total = 0
    item.save
    item
  end
      
  def self.find_shit_in_timeline(shit, date)
    shit.timelines.where(:date => date)
  end
  
  def inc_total
    self.total = self.total + 1
    self.save
  end

end
