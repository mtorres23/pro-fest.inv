class Client < ApplicationRecord
	has_many :users
	has_many :events
	has_many :locations, through: :events
	has_many :categories, through: :locations
	has_many :orders, through: :categories
	has_many :items, through: :orders
end
