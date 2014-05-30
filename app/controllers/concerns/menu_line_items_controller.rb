class MenuLineItemsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  
  def index
  	@menu_line_items = MenuLineItem.all
  end
  
  def show; end

  def new
    @menu_line_item= Order.new
  end

  def create
    @menu_line_item = current_user.build(menu_line_item_params)
      if @menu_line_item.save 
        flash[:success] = t(:order_saved)
       #redirect_to food_place_path(@food_place) 
      else
        flash[:error] = t(:order_not_saved)
        render :new	
      end
  end

  def edit; end

  def update
  	if @menu_line_item.update_attributes(food_place_params)
  	  flash[:success] = t(:order_saved)
  	  #redirect_to food_place_path(@food_place)
  	else
  	  flash[:error] = t(:order_not_saved)
  	  render :edit
  	end	
  end

  def destroy
  	@menu_line_item.destroy
  	#redirect_to food_places_path
  end

  private

  def find_order
    @menu_line_item = MenuLineItem.find(params[:id])
  end	
  
  def order_params
    params.require(:menu_line_item).permit(:menu_option_id)
  end
end
