class Item < ApplicationRecord
	belongs_to :location
	belongs_to :product
	attribute :quantity, :integer, default: 0
end
