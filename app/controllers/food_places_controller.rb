# Controller for Food places' management
class FoodPlacesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_place, only: [:show, :edit, :update, :destroy]
  before_action :find_menu_options, only: [:edit, :update]

  def index
    @food_places = FoodPlace.order('name').page(params[:page]).per(6)
  end

  def show
  end

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

  def edit
  end

  def update
    
    if food_place_params[:stars] 
      stars = food_place_params[:stars].to_i + @food_place.stars
      @food_place.update_attributes(stars: stars)
      @food_place.update_attributes(times_rated: @food_place.times_rated + 1)
      @food_place.update_attributes(rating: @food_place.stars/ @food_place.times_rated)
      redirect_to food_place_path(@food_place)
    elsif @food_place.update_attributes(food_place_params)
      binding.pry
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

  def find_menu_options
    @menu_option = MenuOption.new(food_place_id: @food_place.id)
  end


  def food_place_params
    params.require(:food_place).permit(
      :name, :phone_number, :time, :address1, :address2,:stars,
      :city, :state, :photo, :latitude, :longitude
    )
  end 
end
