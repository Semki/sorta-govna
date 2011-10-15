class InfoController < ApplicationController
  respond_to :html, :js
  
  def shit_info
    @shit = Shit.find(params[:shit_id])
  end
end
