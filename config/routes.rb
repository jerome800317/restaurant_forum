Rails.application.routes.draw do

  devise_for :users
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
    #https://localhost:3000/admin/
  end
  
end
