class DataController < ApplicationController
  before_action :set_datum, only: %i[ show edit update destroy ]
  # respond_to :js, :json, :html, :text, :string
  require 'json'

  # GET /data
  def index
    @data = Datum.all
    @hole = Hole.where(id: params[:id]).first
    puts @hole
  end

  # GET /data/1
  def show
  end

  # GET /data/new
  def new
    @datum = Datum.new()
    @course_name = params[:course_name]
    @hole_id = params[:id]
  end

  # GET /data/1/edit
  def edit    
    @hole_id = params[:id]
    @course_name = params[:course_name]
    @xCoordinates = params[:xCoordinates]
    @yCoordinates = params[:yCoordinates]
    @terrain_type = params[:terrain_type]
  end

  # POST /data
  def create
    @datum = Datum.new(datum_params)    
    if @datum.save
      puts "Saved"
      redirect_to '/holes',notice: "Datum was successfully created."
    else
      puts "GG"
      puts @datum.errors.inspect
      render :new, status: :unprocessable_entity
    end
  end

  def deleter
    puts datum_params["hole_id"]
    @datum = Datum.where(hole_id: datum_params["hole_id"])
    puts @datum

    for a in @datum
      puts a
      a.destroy
    end

  end

  # PATCH/PUT /data/1
  def update

    # if @datum.update(datum_params)
    #   redirect_to @datum, notice: "Datum was successfully updated."
    # else
    #   render :edit, status: :unprocessable_entity
    # end
    redirect_to '/holes'
  end

  # DELETE /data/1
  def destroy
    @datum.destroy
    redirect_to data_url, notice: "Datum was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def datum_params
      params.require(:datum).permit(:xCoordinates, :yCoordinates, :hole_id, :user_hole_id, :terrain_type)
    end
end