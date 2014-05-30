class OrdersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_food_places, only: [:new, :edit]
  before_action :find_food_place, only: [:edit]
  before_action :find_menu_options, only: [:edit]

  def index
  	@orders = Order.all
  end
  
  def show; end

  def new
    @order= Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
      if @order.save 
        flash[:success] = t(:order_saved)
       redirect_to edit_order_path(@order) 
      else
        flash[:error] = t(:order_not_saved)
        render :new	
      end
  end

  def edit; end

  def update
  	if @order.update_attributes(order_params)
  	  flash[:success] = t(:order_saved)
  	  redirect_to edit_order_path(@order) 
  	else
  	  flash[:error] = t(:order_not_saved)
  	  render :edit
  	end	
  end

  def destroy
  	@order.destroy
  	#redirect_to food_places_path
  end

  private

  def find_order
      @order = Order.find(params[:id])
  end

  def find_food_place
    @food_place = FoodPlace.find(@order.food_place_id)
  end	

  def find_food_places
     @food_places = FoodPlace.all
  end 

  def find_menu_options
    @menu_options = @food_place.menu_options
  end
  
  def order_params
    params.require(:order).permit(:food_place_id, menu_line_items_attributes: [:order_id, :quantiy, :menu_option_id, :_destroy])
  end
end
