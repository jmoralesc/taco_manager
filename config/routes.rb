Rails.application.routes.draw do
  devise_for :users
  resources :food_places do
    resources :menu_options
  end
  root 'home#index'
end
