class Event < ApplicationRecord
	belongs_to :account
	has_many :locations
	has_many :bins, through: :locations
	has_many :transactions, through: :orders
	has_many :orders, through: :locations
	has_many :items, through: :bins

	attr_accessor :address
	geocoded_by :address
	after_validation :geocode
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode

end
