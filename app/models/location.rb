class Location < ApplicationRecord
	belongs_to :event
	has_many :users
	has_many :categories
	has_many :orders, through: :categories
	has_many :items, through: :orders
	
end
