# Controller for Orders' management
class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_users, only: [:new]
  before_action :find_food_places, only: [:new, :edit]
  before_action :find_food_place, only: [:edit, :show]
  before_action :find_menu_options, only: [:edit]
  def index
    @orders = Order.accessible_by current_ability
  end

  def show
    authorize! :show, @order
    prepare_users
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = t(:order_saved)
      redirect_to edit_order_path(@order)
      @a = User.find(params[:invitedu][:id])
      @a.each do |user|
         binding.pry
         UserMail.invitation(user).deliver
      end  
      else
        flash[:error] = t(:order_not_saved)
        render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      flash[:success] = t(:order_saved)
      @total = 0
      update_menu_lines(@order.menu_line_items, current_user)
      @order.update_attributes(total: @total)
      redirect_to :back
      else
        flash[:error] = t(:order_not_saved)
        render :edit
    end
  end

  def destroy
    @order.destroy
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

  def update_menu_lines(menu_line_items, user)
    menu_line_items.each do |menu_line_item|
      unless menu_line_item.user
        subtotal = menu_line_item.menu_option.price * menu_line_item.quantiy
        menu_line_item.update_attributes(subtotal: subtotal)
        menu_line_item.update_attributes(user_id: user.id)
        menu_line_item.update_attributes(payed: menu_line_item.payed)
      end
      @total += menu_line_item.subtotal
    end
  end

  def find_menu_options
    @menu_options = @food_place.menu_options
  end

  def find_users
    @users = User.all
  end

  def prepare_users
    @positions = %w(right top left bottom)
    order_users = []
    @count_lines = Hash.new(0)
    @order.menu_line_items.each do |menu_line_item|
      order_users << menu_line_item.user
      @count_lines[menu_line_item.user] += 1
    end
    @order_users = order_users.uniq
  end

  def order_params
    params.require(:order).permit(
      :food_place_id, menu_line_items_attributes: [:id, :menu_option_id, :payed,
                                                   :quantiy, :_destroy
                                                  ]
    )
  end
end
