class MainController < ApplicationController
  respond_to :html, :js
  autocomplete :shit, :name
  
  def index
  end

  # top list of sheet
  def topshit
    @topshits = Shit.topshit(10)        
  end
	
 
  def shit_it
    make_notice_about_shitting(Shit.shit_by_name(params[:name]))    
    respond_with("shit_it")
  end    
  
  def shit_by_id
    make_notice_about_shitting(Shit.shit_by_id(params[:id]))
    redirect_to :action => 'index'
  end
  
  def make_notice_about_shitting(shit)
    flash[:notice] = t(:officially_shit, :name=>shit.capitalized_name, :count=>shit.total.to_s)
  end
  
  def compare
    if params[:name]
      @sorted_shits = Shit.with_names(params[:name].values).sort_by{|s| s.total}.reverse
      @do_compare = true
    end
  end
  
end
