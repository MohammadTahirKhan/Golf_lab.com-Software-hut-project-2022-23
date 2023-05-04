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
    @datum.hole_id = params[:id]
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

  def bob
    puts "BHHA"
    @datum = Datum.create(datum_params)
  end

  # POST /data
  def create
    # sleep 2
    redirect_to "/holes"
  end

  def deleter
    Datum.where(user_hole_id: datum_params["user_hole_id"], hole_id: datum_params["hole_id"]).delete_all
  end

  # PATCH/PUT /data/1
  def update
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
      # @datum = Datum.find(hole_id: params[:id])
      @datum = Datum.new()
    end

    # Only allow a list of trusted parameters through.
    def datum_params
      params.require(:datum).permit(:xCoordinates, :yCoordinates, :hole_id, :user_hole_id, :terrain_type)
    end
end