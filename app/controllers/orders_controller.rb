class OrdersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_menu_line_items, only: [:show, :edit, :update]
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
      @order.menu_line_items.each do |menu_line_item|
        subtotal = menu_line_item.menu_option.price * menu_line_item.quantiy
        menu_line_item.update_attributes(:subtotal => subtotal)
        menu_line_item.update_attributes(:user_id => current_user.id)
        binding.pry
      end

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

  def find_menu_line_items
    @menu_line_items = @order.menu_line_items
  end
  
  def order_params
    params.require(:order).permit(:food_place_id, menu_line_items_attributes: [:id, :menu_option_id, :quantiy, :_destroy])
  end
end
