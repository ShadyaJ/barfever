Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events, only: [:index, :show]
  get '/welcome', to: 'pages#welcome'

  resources :bars, only:[:index, :show, :incoming_event] do
    resources :reviews, only: [:new, :create]
    member do
      get :full_map
    end
  end
  get '/full_map_home', to: 'bars#full_map_home'
end
