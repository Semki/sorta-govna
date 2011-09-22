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
    name = params[:name]
    if name != ''
      flash[:last_shit] = name
      name_upcase = name.mb_chars.upcase.strip
      @shit = Shit.find_by_name(name_upcase)
      if @shit.nil?
        @shit = Shit.new do |s|
          s.name = name_upcase
          s.total = 0
        end
      end
      @shit.total = @shit.total + 1
      @shit.save
      flash[:last_shit] = @shit
    end
    redirect_to :action => 'index'
  end

end
