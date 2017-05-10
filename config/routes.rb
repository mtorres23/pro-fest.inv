Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :clients do
      resources :items
      resources :events
    end
    resources :events do
      resources :locations do
        resources :orders, except: [:destroy]
        resources :items, except: [:destroy]
      end
    end

# Custom Routes
# Order Routes
# route to view details from a specific order
get '/locations/:location_id/orders/:order_id' => 'order#show', as: 'order'

# Item Routes
# route to get all items from a specific client
get '/clients/:client_id/items' => 'items#client_items', as: 'items_by_client'

# Location Routes
# route to get all current items in a specific location    
get '/locations/:location_id/items' => 'items#location_items', as: 'location_items'
post '/events/:event_id/locations' => 'locations#create', as: 'create_location'

  root to: 'clients#show'
get '*path', to: 'clients#show'


end
