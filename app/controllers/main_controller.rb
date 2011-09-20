class MainController < ApplicationController
  def index
  end

  # top list of sheet
  def topshit
    @topshit = Shit.order("total desc").limit(10)
    respond_to do |format|
  		format.html # index.html.erb
  		format.xml  { render :xml => @topshit }
    end
  end
	
 
  def shit
    @shit = Shit.where(:name=>params[:name]).first
#    if @shit.nil? then  @shit = Shit.new end 
    @shit = Shit.new
    @shit.total = @shit.total + 1
    redirect_to :action => 'index'
  end
end
