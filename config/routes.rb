Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root route
  root "home#index"

  # Bars routes
  resources :bars, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # Nested routes for beer mats
    resources :beer_mats, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    # Nested routes for updates (bar announcements)
    resources :updates, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # User beer mats routes (for collecting beer mats)
  resources :user_beer_mats, only: [:index, :create, :destroy]

  # Messages routes (for chat between users and bar owners)
  resources :messages, only: [:index, :create]

  # Notifications routes (for bar owners to receive notifications)
  resources :notifications, only: [:index, :show]

  # Reports routes (for admins to generate reports)
  resources :reports, only: [:index, :show, :create]

  # Admin namespace for admin-specific actions
  namespace :admin do
    # Dashboard route
    get 'dashboard', to: 'dashboard#index'

    # Routes for managing users
    resources :users, only: [:index, :show, :edit, :update, :destroy]

    # Routes for managing bars
    resources :bars, only: [:index, :show, :edit, :update, :destroy]
  end

  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
