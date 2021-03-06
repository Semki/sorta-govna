class SynonymsController < ApplicationController
  respond_to :html, :js
  autocomplete :synonym, :name, :extra_data => [:shit_id,:relevance] ,:display_value => :description,
  :scopes => [:autocomplete_scope]
  
  def index
    @title = t(:page_synonym_index)
    @synonyms = Synonym.order(:name).page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @synonyms }
    end
  end

  # GET /synonyms/1
  # GET /synonyms/1.json
  def show
    @title = t(:page_synonym_show)
    @synonym = Synonym.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @synonym }
    end
  end

  # GET /synonyms/new
  # GET /synonyms/new.json
  def new
    @title = t(:page_synonym_create)
    @synonym = Synonym.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @synonym }
    end
  end

  # GET /synonyms/1/edit
  def edit
    @synonym = Synonym.find(params[:id])
    @title = t(:page_synonym_edit, :name => @synonym.name)
  end

  # POST /synonyms
  # POST /synonyms.json
  def create
    @synonym = Synonym.new(params[:synonym])

    respond_to do |format|
      if @synonym.save
        format.html { redirect_to @synonym, notice: 'Synonym was successfully created.' }
        format.json { render json: @synonym, status: :created, location: @synonym }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /synonyms/1
  # PUT /synonyms/1.json
  def update
    @synonym = Synonym.find(params[:id])

    respond_to do |format|
      if @synonym.update_attributes(params[:synonym])
        format.html { redirect_to @synonym, notice: 'Synonym was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synonyms/1
  # DELETE /synonyms/1.json
  def destroy
    @synonym = Synonym.find(params[:id])
    @synonym.destroy

    flash[:page] = params[:page];
    #redirect_to synonyms_path
    #respond_to do |format|
     # format.html { redirect_to synonyms_path}
      #format.json { head :ok }
    #end
  end    
    
end
