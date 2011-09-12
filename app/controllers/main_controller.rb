class MainController < ApplicationController
  def index
  end
  
  def shit
    @shit = Shit.where(:name=>params[:name]).first
#    if @shit.nil? then  @shit = Shit.new end 
    @shit = Shit.new
    @shit.total = @shit.total + 1
    redirect_to :action => 'index'
  end
end
