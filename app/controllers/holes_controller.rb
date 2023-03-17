class HolesController < ApplicationController
  before_action :set_hole, only: %i[ show edit update destroy ]

  # GET /holes
  def index
    @holes = Hole.all
  end

  # GET /holes/1
  def show
  end

  # GET /holes/new
  def new
    @hole = Hole.new
  end

  # GET /holes/1/edit
  def edit
  end

  # POST /holes
  def create
    @hole = Hole.new(hole_params)

    if @hole.save
      id  = @hole.id
      redirect_to @hole, notice: "Hole was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holes/1
  def update
    if @hole.update(hole_params)
      x = params[:id]
      redirect_to @hole, notice: "Hole was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /holes/1
  def destroy
    @hole.destroy
    redirect_to holes_url, notice: "Hole was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hole
      @hole = Hole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hole_params
      params.require(:hole).permit(:hole_number, :is_beingEdited, :user_id, :course_id)
    end
end
