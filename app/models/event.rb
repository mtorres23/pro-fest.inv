class Event < ApplicationRecord
	belongs_to :client
	has_many :users
	has_many :locations
	has_many :categories, through: :locations
	has_many :orders, through: :categories
	has_many :items, through: :orders	
end
