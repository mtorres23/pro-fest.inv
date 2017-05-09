Rails.application.routes.draw do
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :api do
    resources :clients, :events, :locations, :categories, :orders, :items

  end



resources :clients, :events, :locations, :categories, :orders, :items

  root to: 'client#dashboard'
get '*path', to: 'client#dashboard'


end
