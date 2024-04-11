Rails.application.routes.draw do
  resources :participations
  resources :seniors
  resources :structures
  resources :partners
  resources :activities
  resources :devices
  resources :games
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  get '/export_data', to: 'home#export_data', format: :csv

  get 'add_page' => 'pages#add_page', as: :add_page

  devise_for :users


  resources :activities do
    get 'show_participations', on: :member
  end

  resources :seniors do
    get 'show_participations', on: :member
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
