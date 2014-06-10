class HomeController < ApplicationController
  
  def index
    @random_food_places = FoodPlace.order("RANDOM()").first(3) 
    @food_places = FoodPlace.all
    @trio_food_places = FoodPlace.all.each_slice(3).to_a
  end

end
