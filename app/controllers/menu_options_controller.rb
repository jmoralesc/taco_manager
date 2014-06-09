class MenuOptionsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :find_place
  before_action :find_menu_option, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @menu_option = @food_place.menu_options.build
  end

  def create
    @menu_option = @food_place.menu_options.build(menu_option_params)
      if @menu_option.save 
        flash[:success] = t(:menu_option_saved)
        redirect_to food_place_path(@food_place) 
      else
        flash[:error] = t(:menu_option_not_saved)
        render :new	
      end
  end

  def edit; end

  def update
  	if @menu_option.update_attributes(menu_option_params)
  	  flash[:success] = t(:menu_option_saved)
  	  redirect_to food_place_menu_option_path(@food_place, @menu_option)
  	else
  	  flash[:error] = t(:menu_option_not_saved)
  	  render :edit
  	end	
  end

  def destroy
  	@menu_option.destroy
  	redirect_to food_place_path(@food_place)
  end

  private

  def find_menu_option
    @menu_option = @food_place.menu_options.find(params[:id])
  end
  
  def find_place
    @food_place = FoodPlace.find(params[:food_place_id])
  end  

  def menu_option_params
    params.require(:menu_option).permit(:name, :price, :photo)
  end
     
end
