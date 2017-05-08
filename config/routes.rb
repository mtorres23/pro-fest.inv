Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resources :locations, except: [:update, :edit, :destroy]

root to: 'client#dashboard'
get '*path', to: 'client#dashboard'

end
