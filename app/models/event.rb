class Event < ApplicationRecord
	belongs_to :account
	belongs_to :customer
	has_many :locations
	has_many :assignments
	has_many :messages
	has_many :items, through: :locations
	has_many :transactions, through: :orders
	has_many :orders, through: :locations
	validates_presence_of :address

	geocoded_by :address
	after_validation :geocode

end
