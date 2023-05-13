class GolfClubsController < ApplicationController
    before_action :set_golf_club, only: [:show, :edit, :update, :destroy]
  
    def index
      @golf_clubs = GolfClub.all
    end
  
    def show
    end
  
    def new
      @golf_club = GolfClub.new
    end
  
    def create
      @golf_club = GolfClub.new(golf_club_params)
  
      if @golf_club.save
        redirect_to @golf_club, notice: 'Golf club was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @golf_club.update(golf_club_params)
        redirect_to @golf_club, notice: 'Golf club was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @golf_club.destroy
      redirect_to golf_clubs_url, notice: 'Golf club was successfully destroyed.'
    end
  
    private
      def set_golf_club
        @golf_club = GolfClub.find(params[:id])
      end
  
      def golf_club_params
        params.require(:golf_club).permit(:name, :manufacturer, :club_type, :user_hole_id)
      end
  end
  