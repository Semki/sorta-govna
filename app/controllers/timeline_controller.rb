class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)
  end
  
  def show_by_shit
    shit = Shit.find(params[:shit_id])
    
    # @timeline = shit.timelines.order("date asc")
    @timeline = shit.timelines.order(:date)
  end
end
