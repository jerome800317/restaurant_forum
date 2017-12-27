Rails.application.routes.draw do

  devise_for :users
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :edit, :update]
  resources :restaurants, only: [:index, :show] do
    resources :comments, only:[:create, :destroy]

    collection do       # => Verb Controller Action URI
      get :feeds        # => GET  restaurants#feeds restaurant/feeds
    end

    member do           # => Verb Controller Action     URI
      get :dashboard    # => GET  restaurants#dashboard restaurant/:id/dashboard
    end
  end
  resources :categories, only: [:show]
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
    #https://localhost:3000/admin/
  end
  
end
