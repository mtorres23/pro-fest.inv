class Category < ApplicationRecord
	belongs_to :location
	has_many :orders
	has_many :items, through: :orders
end
