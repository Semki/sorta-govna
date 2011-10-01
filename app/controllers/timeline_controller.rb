class TimelineController < ApplicationController
  def index
    @timeline = Timeline.limit(100)

  end
end
