Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, only: [:create, :new, :show]

  root 'application#home'
end
