Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :preferences do
    resources :chatrooms, only: [:create, :show]
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

  resources :users

  resources :preferences do
    collection do
      get :matches
    end
  end


 # get "my_bookings", to: "pages#my_bookings"
end
