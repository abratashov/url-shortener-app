Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, only: [:create, :new, :show]
  resources :redirections, only: [:show]
  resources :statistics, only: [:index, :show]

  root 'statistics#index'

  get '/:short_link', to: 'redirections#show'
end
