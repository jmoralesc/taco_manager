class FoodPlacesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_action :find_place, only: [:show, :edit, :update, :destroy]
  
  def index
  	@food_places = FoodPlace.all
  end
  
  def show; end

  def new
    @food_place = FoodPlace.new
  end

  def create
    @food_place = current_user.food_places.build(food_place_params)
      if @food_place.save 
        flash[:success] = t(:food_place_saved)
        redirect_to food_place_path(@food_place)
      else
        flash[:error] = t(:food_place_not_saved)
        render :new	
      end
  end

  def edit; end

  def update
  	if @food_place.update_attributes(food_place_params)
  	  flash[:success] = t(:food_place_saved)
  	  redirect_to food_place_path(@food_place)
  	else
  	  flash[:error] = t(:food_place_not_saved)
  	  render :edit
  	end	
  end

  def destroy
  	@food_place.destroy
  	redirect_to food_places_path
  end

  private

  def find_place
    @food_place = FoodPlace.find(params[:id])
  end	
  
  def food_place_params
    params.require(:food_place).permit(:name, :phone_number, :time, :address1, :address2, :city, :state)
  end
end
