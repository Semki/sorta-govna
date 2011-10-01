class ShitsController < ApplicationController
	respond_to :html, :js
	
  # GET /shits
  # GET /shits.xml
  def index
    @shits = Shit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shits }
    end
  end

  # GET /shits/1
  # GET /shits/1.xml
  def show
    @shit = Shit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shit }
    end
  end

  # GET /shits/new
  # GET /shits/new.xml
  def new
    @shit = Shit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shit }
    end
  end

  # GET /shits/1/edit
  def edit
    @shit = Shit.find(params[:id])
  end

  # POST /shits
  # POST /shits.xml
  def create
    @shit = Shit.new(params[:shit])

    respond_to do |format|
      if @shit.save
        format.html { redirect_to(@shit, :notice => 'Shit was successfully created.') }
        format.xml  { render :xml => @shit, :status => :created, :location => @shit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shits/1
  # PUT /shits/1.xml
  def update
    @shit = Shit.find(params[:id])

    respond_to do |format|
      if @shit.update_attributes(params[:shit])
        format.html { redirect_to(@shit, :notice => 'Shit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shits/1
  # DELETE /shits/1.xml
  def destroy
    @shit = Shit.find(params[:id])
    @shit.destroy

    respond_to do |format|
      format.html { redirect_to(shits_url) }
      format.xml  { head :ok }
    end
  end
end
