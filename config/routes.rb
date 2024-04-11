Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :partners do
      get 'show_structures', on: :member
    end
  end
  resources :devices
  resources :games

  resources :structures
  resources :seniors
  resources :activities
  resources :participations

  get '/export_data', to: 'home#export_data', format: :csv

  get 'add_page' => 'pages#add_page', as: :add_page


  resources :activities do
    get 'show_participations', on: :member
  end

  resources :seniors do
    get 'show_participations', on: :member
  end

  resources :structures do
    get 'show_ateliers', on: :member
  end

  resources :structures do
    get 'show_seniors', on: :member
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
