class UserHolesController < ApplicationController
  before_action :set_user_hole, only: %i[ show edit update destroy ]

  # GET /user_holes
  def index
    @user_holes = UserHole.where(user_id: current_user.id)
  end

  # GET /user_holes/1
  def show
  end

  # GET /user_holes/new
  def new
    @holes = Hole.all
    @user_hole = UserHole.new
  end

  # GET /user_holes/1/edit
  def edit
    @data = Datum.where(hole_id: params[:id])
    @xCoordinates = []
    @yCoordinates = []
    @terrain_type = []
    
    @data.each do |data| 
      @xCoordinates.append(data.xCoordinates)
      @yCoordinates.append(data.yCoordinates)
      @terrain_type.append(data.terrain_type)
    end

    puts @data
  end

  # POST /user_holes
  def create
    holeNumber = Hole.where(id: user_hole_params[:hole_id]).first.hole_number
    @user_hole = UserHole.new(
      hole_id: user_hole_params[:hole_id], 
      user_id: current_user.id, 
      hole_number: holeNumber
    )
    
    if @user_hole.save
      redirect_to @user_hole, notice: "User hole was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_holes/1
  def update
    if @user_hole.update(user_hole_params)
      redirect_to @user_hole, notice: "User hole was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /user_holes/1
  def destroy
    @user_hole.destroy
    redirect_to user_holes_url, notice: "User hole was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_hole
      @user_hole = UserHole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_hole_params
      params.require(:user_hole).permit(:hole_id, :hole_number, :user_id)
    end
end