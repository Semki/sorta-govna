# encoding: utf-8
class MainController < ApplicationController
  respond_to :html, :js
  autocomplete :shit, :name
  
  def index
		@title = t(:page_root)
  end

  # top list of sheet
  def topshit
		@title = t(:page_top_list)
    @topshits = Shit.topshit(10)
  end
	
  def shit_it
    if params[:id].present?
      make_notice_about_shitting(Shit.shit_by_id(params[:id]))    
    else
      if params[:autocomplete_synonym]
        @shit = Shit.new
        @shit.total = 1
        @shit.name = params[:autocomplete_synonym]
        render :action => 'creation_wizard'
      end
    end
  end    
  
  def shit_by_id
    make_top_shit_notice_about_shitting(Shit.shit_by_id(params[:id]))
  end
  
  def create_shit
    @shit = Shit.new(params[:shit])
    @shit.created_by_guest = true
    @shit.save
    make_notice_about_shitting(@shit)
    render :action => :shit_it
  end
  
  def compare
		@title = t(:page_compare)
    if params[:name]
      @sorted_shits = Shit.with_names(params[:name].values).sort_by{|s| s.total}.reverse
      @do_compare = true
    end
  end
  
  private 
  
  def make_notice_about_shitting(shit)
    flash[:shitted_count] = shit.total
    flash[:shit_name] = shit.name
  end
  
  def make_top_shit_notice_about_shitting(shit)
    flash[:shitId] = shit.id.to_s
    flash[:total] = shit.total
  end
  
end
