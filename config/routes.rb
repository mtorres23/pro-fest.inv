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

    #Modal Routes
# route to view all client's events in the modal
get '/clients/:client_id/events#modal1' => 'events#index', as: 'client_events_modal'
# route to view a specific client's event in the modal
get '/clients/:client_id/events/:event_id#modal1' => 'events#show', as: 'client_event_modal'
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
get '/locations/:location_id/orders' => 'orders#orders_by_location', as: 'location_orders'

get '/events/:event_id/orders' => 'orders#orders_by_event', as: 'event_orders'

  root to: 'clients#dashboard'



end
