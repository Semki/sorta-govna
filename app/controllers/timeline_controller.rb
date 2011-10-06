class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)
  end
  
  def show_by_shit_by_week
    weekindex = 0
    weekindex = params[:week].to_f unless params[:week].nil?
    @img = Timeline.show_by_shit_by_week(params[:shit_id], weekindex)
  end
  
  def weekrating
    datefinish = Date.today
    datestart = datefinish - 6
    @timeline = Timeline.get_by_period(datestart, datefinish)
  end
end
