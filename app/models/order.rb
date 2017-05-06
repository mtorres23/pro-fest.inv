class Order < ApplicationRecord
	belongs_to :location
	has_many :items
end
