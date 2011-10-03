class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)
  end
  def show_by_shit
    
    shit = Shit.find(params[:shit_id])
    timeline = shit.timelines.order(:date)
    datesline = timeline.map{|x| x.date}
    totalline = timeline.map{|x| x.total}
    
    width = 600
    barwidth = 15
    header_height = 50
    height = header_height + totalline.length * barwidth
    str = width.to_s + 'x' + height.to_s
    
    #@img = Gchart.bar(:title => 'by days',  :labels => shit.timelines.map{|x| x.date}, :legend => shit.name, :data => shit.timelines.map{|x| x.total})
    @img = Gchart.bar(:title => t(:timeline_by_shit), :orientation => 'horizontal', :bar_width_and_spacing => barwidth, 
    :axis_with_labels => 'y,r', :axis_labels => [datesline, totalline.reverse], :legend => shit.name, :data => totalline, :size => str)
    
    @img
  end
  
  def weekrating
    datefinish = Date.today
    datestart = datefinish - 6
    @timeline = Timeline.get_by_period(datestart, datefinish)
  end
end
