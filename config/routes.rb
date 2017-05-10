Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

namespace :api do
    resources :clients do
      resources :events do
        resources :locations do
          resources :categories do
            resources :orders do
              resources :items do
              end
            end
          end
        end
      end
    end
  end

    resources :clients do
      resources :events do
        resources :locations do
          resources :categories do
            resources :orders do
              resources :items do
              end
            end
          end
        end
      end
    end
  root to: 'client#dashboard'
get '*path', to: 'client#dashboard'


end
