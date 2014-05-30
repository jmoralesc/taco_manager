Rails.application.routes.draw do
  devise_for :users 
  resources :orders do
    resources :menu_line_items
  end  
  resources :food_places do
    resources :menu_options
  end

  root 'home#index'
end
