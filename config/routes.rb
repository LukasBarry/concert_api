require 'api_constraints'

Rails.application.routes.draw do
  # devise_for :users
  # resources :posts
  # resources :events
  # resources :carts
  # post 'line_items' => 'tickets#line_item_create'
  # post 'order_complete' => 'carts#order_complete'

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:show]
      resources :events, only: [:show]
      resources :carts, only: [:show]
      resources :posts, only: [:show]
      resources :tickets, only: [:show]
    end
  end
end
