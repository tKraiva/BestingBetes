Rails.application.routes.draw do
  resources :recurring_events
  resources :events
  resources :food_journals
  root 'visitors#index'
end
