class MenuLineItemController < ApplicationController

  before_filter :authenticate_user!, except: [:show]
  before_action :find_order
  before_action :find_menu_option, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @menu_line_item = #@food_place.menu_options.build
  end

  def create
    @menu_line_item = @order.menu_line_items.build(menu_line_item_params)
      if @menu_line_item.save 
        flash[:success] = t(:menu_line_item_saved)
        #redirect_to food_place_path(@food_place) 
      else
        flash[:error] = t(:menu_line_item_not_saved)
        render :new 
      end
  end

  def edit; end

  def update
    if @menu_line_item.update_attributes(menu_line_item_params)
      flash[:success] = t(:menu_line_item_saved)
      #redirect_to food_place_menu_option_path(@food_place, @menu_option)
    else
      flash[:error] = t(:menu_line_item_not_saved)
      render :edit
    end 
  end

  def destroy
    @menu_line_item.destroy
    #redirect_to food_place_path(@food_place)
  end

  private

  def find_menu_line_items
    @menu_line_item = @order.menu_line_items.find(params[:id])
  end
  
  def find_order
    @order = Order.find(params[:order_id])
  end  

  def menu_option_params
    params.require(:menu_line_item).permit(:name, :price)
  end

   
end
