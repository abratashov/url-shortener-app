Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, only: [:create, :new, :show]

  root 'dashboard#index'

  get 'dashboard' => 'dashboard#index', as: :dashboard
  get 'dashboard/:short_link' => 'dashboard#statistics', as: :statistics

  get '/:short_link' => 'redirections#index'
end
