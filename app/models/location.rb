class Location < ApplicationRecord
	belongs_to :event, optional: true
	has_many :users
	has_many :categories
	has_many :orders, through: :categories
	has_many :items, through: :orders


	attr_accessor :address

geocoded_by :address
after_validation :geocode




end
