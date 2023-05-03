class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  # Require admin role to access admin page
  def require_admin
    unless current_user.user_role == "admin"
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:user_role)
    @user.update(user_params)
    redirect_to admin_index_path
  end

  def destroy
    @user = User.find(params[:id])
    @user_hole = UserHole.find_by(user_id: @user.id)
    if @user.user_role == "user" && @user_hole != nil
        for user_hole in @user_hole
            user_hole.destroy
        end
    end
    if @user.user_role == "user" 
        @user.destroy
    end

    redirect_to admin_index_path
  end

end