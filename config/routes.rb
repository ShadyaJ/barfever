Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reviews, only: %i(new create)
  resources :events, only: [:index, :show]
  get '/welcome', to: 'pages#welcome'

  resources :bars, only:[:index, :show, :incoming_event]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
