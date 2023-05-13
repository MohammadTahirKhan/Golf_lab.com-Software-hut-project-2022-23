class HandicapsController < ApplicationController
    before_action :set_handicap, only: [:show, :edit, :update, :destroy]
  
    def index
      @handicaps = Handicap.all
    end
  
    def show
    end
  
    def new
      @handicap = Handicap.new
    end
  
    def create
      @handicap = Handicap.new(handicap_params)
  
      if @handicap.save
        redirect_to @handicap, notice: 'Handicap was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @handicap.update(handicap_params)
        redirect_to @handicap, notice: 'Handicap was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @handicap.destroy
      redirect_to handicaps_url, notice: 'Handicap was successfully destroyed.'
    end
  
    private
      def set_handicap
        @handicap = Handicap.find(params[:id])
      end
  
      def handicap_params
        params.require(:handicap).permit(:value, :user_hole_id)
      end
  end
  