class SynonymsController < ApplicationController
  # GET /synonyms
  # GET /synonyms.json
  
  autocomplete :synonym, :name
  
  def index
    @synonyms = Synonym.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @synonyms }
    end
  end

  # GET /synonyms/1
  # GET /synonyms/1.json
  def show
    @synonym = Synonym.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @synonym }
    end
  end

  # GET /synonyms/new
  # GET /synonyms/new.json
  def new
    @synonym = Synonym.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @synonym }
    end
  end

  # GET /synonyms/1/edit
  def edit
    @synonym = Synonym.find(params[:id])
  end

  # POST /synonyms
  # POST /synonyms.json
  def create
    @synonym = Synonym.new(params[:synonym])

    respond_to do |format|
      if @synonym.save
        format.html { redirect_to @synonym, notice: 'Synonym was successfully created.' }
        format.json { render json: @synonym, status: :created, location: @synonym }
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

    respond_to do |format|
      format.html { redirect_to synonyms_url }
      format.json { head :ok }
    end
  end
    
    
    
    
end
