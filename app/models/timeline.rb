class Timeline < ActiveRecord::Base
  belongs_to :shit
  
  def self.add_new_timeline_item(shit)
    date = Date.today
    item = find_shit_in_timeline(shit, date)
    item = Timeline.create_timeline_item(shit, date) if @timelineitem.nil?
    item.inc_total
  end

  def self.create_timeline_item(shit, date)
    self.create(:shit => shit, :date => date, :total => 0 )
  end
      
  def self.find_shit_in_timeline(shit, date)
    shit.timelines.where(:date => date)
  end
  
  def inc_total
    self.total = self.total + 1
    self.save
  end

end
