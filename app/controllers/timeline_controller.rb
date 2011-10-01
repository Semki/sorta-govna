class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)
  end
  
  def show_by_shit
    shit = Shit.find(params[:shit_id])
    @timeline = shit.timelines.order(:date)
  end
  
  def weekrating
    datefinish = Date.today
    datestart = datefinish - 6
    @timeline = Timeline.get_by_period(datestart, datefinish)
  end
end
