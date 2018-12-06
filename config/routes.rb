Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, only: [:create, :new, :show]

  root 'application#home'

  get '/:short_link' => 'redirections#index'
end
