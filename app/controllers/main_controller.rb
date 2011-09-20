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
    name = params[:name].mb_chars.upcase.strip
    name = params[:name].mb_chars.upcase.strip
    if name!=''
      @shit = Shit.find_by_name(name)
      if @shit.nil?
        @shit = Shit.new do |s|
          s.name = name
          s.total = 0
        end
      end
      @shit.total = @shit.total + 1
      @shit.save
    end
    redirect_to :action => 'index'
  end

end
