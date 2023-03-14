class DataController < ApplicationController
  before_action :set_datum, only: %i[ show edit update destroy ]
  # respond_to :js, :json, :html, :text, :string
  require 'json'

  # GET /data
  def index
    @data = Datum.all
  end

  # GET /data/1
  def show
  end

  # GET /data/new
  def new
    @datum = Datum.new
  end

  # GET /data/1/edit
  def edit
  end

  # POST /data
  def create
    
    @datum = Datum.new(datum_params)

    # if @datum.save
    #   redirect_to @datum, notice: "Datum was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /data/1
  def update
    if @datum.update(datum_params)
      redirect_to @datum, notice: "Datum was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
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
      params.require(:datum).permit(:xCoordinates, :yCoordinates, :hole_id, :userhole_id)
    end
end
