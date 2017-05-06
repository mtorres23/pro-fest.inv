class Location < ApplicationRecord
	belongs_to :event
	has_many :orders
	has_many :items, through: :orders
end
