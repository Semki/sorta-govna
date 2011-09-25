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
    make_notice_about_shitting(Shit.shit_by_name(params[:name]))
    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.js
    end
  end
  
  def shit_by_id
    make_notice_about_shitting(Shit.shit_by_id(params[:id]))
    redirect_to :action => 'index'
  end
  
  def make_notice_about_shitting(shit)
    flash[:notice] = shit.capitalized_name + " - officially shit " + shit.total.to_s + " times!" unless shit.nil?
  end
end
