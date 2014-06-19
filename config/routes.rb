Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
   :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :orders do
    resources :menu_line_items
  end  
  resources :food_places do
    resources :menu_options
  end

  root 'home#index'
end
