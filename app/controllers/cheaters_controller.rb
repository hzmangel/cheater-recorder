class CheatersController < ApplicationController
  # GET /cheaters
  # GET /cheaters.json
  def index
    @cheaters = Cheater.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cheaters }
    end
  end

  # GET /cheaters/1
  # GET /cheaters/1.json
  def show
    @cheater = Cheater.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cheater }
    end
  end

  # GET /cheaters/new
  # GET /cheaters/new.json
  def new
    @cheater = Cheater.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cheater }
    end
  end

  # GET /cheaters/1/edit
  def edit
    @cheater = Cheater.find(params[:id])
  end

  # POST /cheaters
  # POST /cheaters.json
  def create
    @cheater = Cheater.new(params[:cheater])

    respond_to do |format|
      if @cheater.save
        format.html { redirect_to @cheater, notice: 'Cheater was successfully created.' }
        format.json { render json: @cheater, status: :created, location: @cheater }
      else
        format.html { render action: "new" }
        format.json { render json: @cheater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cheaters/1
  # PUT /cheaters/1.json
  def update
    @cheater = Cheater.find(params[:id])

    respond_to do |format|
      if @cheater.update_attributes(params[:cheater])
        format.html { redirect_to @cheater, notice: 'Cheater was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cheater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheaters/1
  # DELETE /cheaters/1.json
  def destroy
    @cheater = Cheater.find(params[:id])
    @cheater.destroy

    respond_to do |format|
      format.html { redirect_to cheaters_url }
      format.json { head :no_content }
    end
  end
end
