class UserHolesController < ApplicationController
  before_action :set_user_hole, only: %i[ show edit update destroy ]
  before_action :require_user, only: %i[ show new edit create update destroy ]

  # Require user role to access user_holes page functions
  def require_user
    unless current_user.user_role == "user"
      redirect_to root_path
    end
  end

  # GET /user_holes
  def index
    if current_user.user_role == "user"
      @user_holes = UserHole.where(user_id: current_user.id)
    else
      @user_holes = UserHole.all
    end
  end

  # GET /user_holes/1
  def show
    @data = Datum.where(user_hole_id: @user_hole.id)
    @xCoordinates = []
    @yCoordinates = []
    @terrain_type = []
    
    @data.each do |data| 
      @xCoordinates.append(data.xCoordinates)
      @yCoordinates.append(data.yCoordinates)
      @terrain_type.append(data.terrain_type)
    end
  end

  # GET /user_holes/new
  def new
    @holes = Hole.all
    @user_hole = UserHole.new
  end

  # GET /user_holes/1/edit
  def edit
    @data = Datum.where(hole_id: @user_hole.hole_id)
    @xCoordinates = []
    @yCoordinates = []
    @terrain_type = []
    
    @data.each do |data| 
      @xCoordinates.append(data.xCoordinates)
      @yCoordinates.append(data.yCoordinates)
      @terrain_type.append(data.terrain_type)
    end

  end

  # POST /user_holes/new
  def create
    hole = Hole.where(id: user_hole_params[:hole_id])
    holeNumber = hole.first.hole_number
    @user_hole = UserHole.new(
      hole_id: user_hole_params[:hole_id], 
      user_id: current_user.id, 
      hole_number: holeNumber
    )
    data = Datum.where(hole_id: user_hole_params[:hole_id])
    
    
    
    if @user_hole.save
      userhole_id = @user_hole.id
      for d in data
        b = d.dup
        puts "before"
        puts b
        b.hole_id = nil
        b.user_hole_id = userhole_id
        puts "AFTER"
        puts b
        b.save
      end
 
      redirect_to @user_hole, notice: "User hole was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_holes/1
  def update

    
    
    if @user_hole.update(user_hole_params)
      @data = Datum.where(user_hole_id: @user_hole.id)
      # puts @data
      @xCoordinates = []
      @yCoordinates = []
      @terrain_type = []
    
      @data.each do |data| 
        @xCoordinates.append(data.xCoordinates)
        @yCoordinates.append(data.yCoordinates)
        @terrain_type.append(data.terrain_type)
      end
      redirect_to buraq_path(:id => @user_hole.id, :course_name => @user_hole.hole.course_name, :xCoordinates => @xCoordinates, :yCoordinates => @yCoordinates, :terrain_type => @terrain_type), notice: "User hole was successfully updated."
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