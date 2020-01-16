class Event < ApplicationRecord
	belongs_to :client
	has_many :locations
	has_many :bins, through: :locations
	has_many :transactions, through: :orders
	has_many :orders, through: :locations
	has_many :items, through: :bins

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

reverse_geocoded_by :latitude, :longitude
after_validation :reverse_geocode

end
