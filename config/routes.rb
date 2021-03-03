Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'preferences#matches' , as: :authenticated_root
  end
  root "pages#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :preferences, only: [] do
    collection do
      get :matches
    end
      resources :chatrooms, only: [:create, :show]
  end

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: [:create]
  end

  resources :users do
    collection do
      get :me
    end
  end

end

