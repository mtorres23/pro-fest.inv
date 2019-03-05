Rails.application.routes.draw do

   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :clients do
      resources :items
      resources :events
      resources :orders, except: [:destroy]
    end
    resources :events do
      resources :locations do
        resources :orders, except: [:index, :destroy]
        resources :transactions, except: [:destroy]
      end
    end


# Custom Routes
 # Home Routes
  get 'home' => 'home_pages#home'

  get 'about' => 'home_pages#about'

  get 'faqs' => 'home_pages#faqs'

# Order Routes
# route to view details from a specific order
get '/locations/:location_id/orders/:order_id' => 'order#show', as: 'order'


# Location Routes
# route to get all current items in a specific location
get '/locations/:location_id/items' => 'items#location_items', as: 'location_items'
post '/events/:event_id/locations' => 'locations#create', as: 'create_location'
get '/events/:event_id/locations/:location_id/orders' => 'orders#orders_by_location', as: 'location_orders'
get 'api/events/:event_id/locations' => 'locations#index_as_json', as: 'locations_api_index'
get 'api/events/:event_id/locations/:id' => 'locations#location_json', as: 'location_api'
post '/locations/:location_id/orders' => 'orders#create', as: 'new_location_order'

get '/events/:event_id/orders' => 'orders#orders_by_event', as: 'event_orders'
# get '/events/:event_id/locations/map_edit' => 'locations#map_edit', as: 'locations_map_edit'

  root to: 'clients#dashboard'
get '*path', to: 'clients#dashboard'


end
