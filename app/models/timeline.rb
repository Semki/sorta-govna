class Timeline < ActiveRecord::Base
  belongs_to :shit
  
  def self.add_new_timeline_item(shit)
    date = Date.today
    item = Timeline.find_shit_in_timeline(shit, date)
    item = Timeline.create_timeline_item(shit, date) if item.nil?
    item.inc_total
  end

  def self.create_timeline_item(shit, date)
    self.create(:shit => shit, :date => date, :total => 0 )
  end
      
  def self.find_shit_in_timeline(shit, date)
    shit.timelines.where(:date => date).first
  end
  
  def inc_total
    self.total = self.total + 1
    self.save
  end
  
  def self.get_by_period(startdate, finishdate)
    Timeline.select(' sum("timelines".total) as total, shit_id as shit_id, shits.name as shit_name').where("date >= ? and date <= ?", startdate, finishdate).joins(:shit).group(:shit_id, :shit_name).order("total desc")
  end
  
  def self.show_by_shit_by_week(shit_id, weekindex)
    shit = Shit.find(shit_id)
    period = 7
    datefinish = Date.today + (period * weekindex)
    datestart = datefinish - 6
    timeline = shit.timelines.where("date >= ? and date <= ?", datestart, datefinish).order(:date)
    datesline = timeline.map{|x| x.date}
    totalline = timeline.map{|x| x.total}
    
    
    scaleline = [0..period-1]
    max = 0
    max = totalline.max unless totalline.max.nil?
    
    for i in 1..period-1
      scaleline[i] = (i+1) * (max / period)  
    end
    scaleline[period] = max
    scaleline[0] = 0
    
    for i in 0..period-1
      if datesline.include?(datestart + i)
      else
        datesline.insert(i, datestart + i)
        totalline.insert(i, 0)
      end
    end
    
	title = datestart.to_s + " - " + datefinish.to_s
    str = "600x250"
    Gchart.bar(:title => title, :orientation => 'vertical', :bar_width_and_spacing => 70, 
    :axis_with_labels => ['x', 't', 'r'], :axis_labels => [datesline, totalline, scaleline], :legend => shit.name, :data => totalline, :size => str)
    
  end

end
