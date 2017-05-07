class Location < ApplicationRecord
	belongs_to :event
	has_many :orders, through: :categories
	
	has_many :users
end
