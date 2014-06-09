class HomeController < ApplicationController
  
  def index
    @random_food_places = FoodPlace.order("RANDOM()").first(3) 
  end

end
