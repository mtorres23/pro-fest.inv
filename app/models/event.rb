class Event < ApplicationRecord
	belongs_to :account
	belongs_to :customer
	has_many :locations
	has_many :assignments
	has_many :items, through: :locations
	has_many :transactions, through: :orders
	has_many :orders, through: :locations

	attr_accessor :address
	geocoded_by :address
	after_validation :geocode
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode

end
