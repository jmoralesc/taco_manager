Rails.application.routes.draw do
  devise_for :users
  resources :food_places 
  root 'home#index'
end
