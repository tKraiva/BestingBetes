Rails.application.routes.draw do
  resources :recurring_events
  resources :events
  resources :food_journals
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :destroy, :create]
  root 'visitors#index'
end
