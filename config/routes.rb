Rails.application.routes.draw do

   devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :accounts do
    resources :products
    resources :events
    resources :customers
    resources :users
  end

    resources :events do
      resources :assignments
      resources :locations do
        resources :orders, except: [:index, :create] do
          resources :transactions
        end
      end
    end



# Custom Routes

# customer routes
get '/customers' => 'customers#customer_index', as: 'customers'
get '/accounts/:account_id/customers/:id/events' => 'events#events_by_customer', as: 'account_customer_events'
get '/accounts/:account_id/customers/:id/events/new' => 'events#new_customer_event', as: 'new_account_customer_event'
post '/accounts/:account_id/customers/:id/events' => 'events#create_customer_event', as: 'create_account_customer_event'
# Assignments
get '/accounts/:account_id/users/:user_id/assignments' => 'assignments#user_assignments', as: 'schedule'
get '/events/:event_id/locations/:location_id/assignments' => 'assignments#location_assignments', as: 'location_assignments'

 # Home Routes
  get 'home' => 'home_pages#home'

  get 'about' => 'home_pages#about'

  get 'faqs' => 'home_pages#faqs'

# Order Routes
# route to view details from a specific order
get '/locations/:location_id/orders/:order_id' => 'order#show', as: 'order'

# Location Routes
post '/events/:event_id/locations' => 'locations#create', as: 'create_location'
get 'api/events/:event_id/locations' => 'locations#index_as_json', as: 'locations_api_index'
get 'api/events/:event_id/locations/:id' => 'locations#location_json', as: 'location_api'

# LocationInventoryItems (item) Routes
# route to get all current items in a item in a specific location
get '/locations/:location_id/items' => 'items#inventory', as: 'location_inventory'
get '/locations/:location_id/items/new' => 'items#new', as: 'new_location_item'
post '/locations/:location_id/items' => 'items#create', as: 'create_location_item'
patch '/locations/:location_id/items/:id' => 'items#update_item', as: 'inventory_item_edit'

# Order Routes
post '/locations/:location_id/orders' => 'orders#create', as: 'new_location_order'
get '/events/:event_id/locations/:location_id/orders' => 'orders#orders_by_location', as: 'location_orders'
get '/events/:event_id/orders' => 'orders#orders_by_event', as: 'event_orders'
get '/events/:event_id/feed' => 'messages#event_feed', as: 'event_feed'
get '/events/:event_id/locations/:location_id/feed' => 'messages#location_feed', as: 'location_feed'
post '/events/:event_id/locations/:location_id/orders/:id/complete' => 'orders#complete', as: 'order_complete'
post '/events/:event_id/locations/:location_id/orders/:id/submit' => 'orders#submit', as: 'order_submit'

# get '/events/:event_id/locations/map_edit' => 'locations#map_edit', as: 'locations_map_edit'
get '/settings' => 'application#settings', as: 'settings'
root to: 'application#settings'
get '*path', to: 'application#settings' # TEMPORARY: Will have to redirect users based on admin level priveleges


end
