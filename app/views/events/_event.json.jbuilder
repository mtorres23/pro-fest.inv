json.extract! event, :id, :title, :start_date, :end_date, :address, :latitude, :longitude, :admin_id, :belongs_to, :has_many, :created_at, :updated_at
json.url event_url(event, format: :json)
