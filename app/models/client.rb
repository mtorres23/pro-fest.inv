class Client < ApplicationRecord
	has_many :users, :foreign_key => :client_id
	has_many :events, :foreign_key => :client_id
	has_many :locations, through: :events
	has_many :transactions, through: :orders
	has_many :orders, through: :locations
	has_many :items, :foreign_key => :client_id

	attr_accessor :address
	geocoded_by :address
	after_validation :geocode
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode
end
