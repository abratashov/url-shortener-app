Rails.application.routes.draw do
  devise_for :users

  resources :short_urls, only: [:create, :new, :show]

  root 'dashboard#index'

  get 'csv_short_links' => 'dashboard#csv_short_links', as: :csv_short_links
  get 'csv_statistics' => 'dashboard#csv_statistics', as: :csv_statistics

  get 'dashboard' => 'dashboard#index', as: :dashboard
  get 'dashboard/:short_link' => 'dashboard#statistics', as: :statistics

  get '/:short_link' => 'redirections#index'
end
