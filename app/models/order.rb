class Order < ApplicationRecord
	belongs_to :location
	has_many :transactions
	has_many :items, through: :transactions
	has_many :messages
end
