class UserDataController < ApplicationController
    def index
        @user_data = UserDatum.all
    end
  
    def new
        @user_datum = UserDatum.new
    end
  
    def create
        @user_datum = UserDatum.new(user_data_params)
        if @user_datum.save
            redirect_to user_data_path(@user_datum), notice: 'User Data was successfully created.'
        else
            render :new
        end
    end
  
    def show
    end
  
    def edit
        @user_datum = UserDatum.find(params[:id])
    end
  
    def update
        @user_datum = UserDatum.find(params[:id])
        if @user_datum.update(user_data_params)
            redirect_to user_data_path(@user_datum), notice: 'User Data was successfully updated.'
        else
            render :edit
        end
    end
  
    def destroy
        @user_datum = UserDatum.find(params[:id])
        @user_datum.destroy
        redirect_to user_data_path, notice: 'User Data was successfully destroyed.'
    end
      
  
    private
  
    def user_data_params
        params.require(:user_datum).permit(:user_hole_id, :score)
    end
end