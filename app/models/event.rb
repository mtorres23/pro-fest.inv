class Event < ApplicationRecord
	belongs_to :client
	has_many :locations
	has_many :categories, through: :locations
	has_many :users, through: :locations
end
