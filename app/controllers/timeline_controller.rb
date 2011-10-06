class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)
  end
  
  def show_by_shit_by_week
    @title = t(:page_shit_by_date)
    weekindex = 0
    weekindex = params[:week].to_f unless params[:week].nil?
    @img = Timeline.show_by_shit_by_week(params[:shit_id], weekindex, t(:timeline_by_shit))
  end
  
  def weekrating
    @title = t(:page_week_rating)
    datefinish = Date.today
    datestart = datefinish - 6
    @timeline = Timeline.get_by_period(datestart, datefinish)
  end
end
