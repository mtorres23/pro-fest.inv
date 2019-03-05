class Location < ApplicationRecord
	belongs_to :event, optional: true
	has_many :users, :foreign_key => :location_id
	has_one :bin, :foreign_key => :location_id
	has_many :categories
	has_many :orders, :foreign_key => :location_id
	has_many :items, through: :bin


	attr_accessor :address

geocoded_by :address
after_validation :geocode




end
