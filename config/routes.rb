Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reviews, only: %i(new create)
  resources :events, only: [:show]
  get '/welcome', to: 'pages#welcome'
  get '/map', to: 'bars#showmap_full', as: :full_map
  resources :bars, only:[:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
