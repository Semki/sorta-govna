class MainController < ApplicationController
  def index
  end

  # top list of sheet
  def topshit
    @topshits = Shit.topshit(10)
    respond_to do |format|
  		format.html # index.html.erb
  		format.xml  { render :xml => @topshits }
    end
  end
	
 
  def shit
    save_last_shit(Shit.shit_by_name(params[:name]))    
    redirect_to :action => 'index'
  end
  
  def shit_by_id
    save_last_shit(Shit.shit_by_id(params[:id]))    
    redirect_to :action => 'index'
  end
  
  def save_last_shit(last_shit)
    flash[:last_shit] = last_shit
  end
  

end
