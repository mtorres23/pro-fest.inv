class Event < ApplicationRecord
	belongs_to :client
	has_many :locations
	has_many :orders, through: :locations
end
