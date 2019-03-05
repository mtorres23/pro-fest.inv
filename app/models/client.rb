class Client < ApplicationRecord
	has_many :users, :foreign_key => :client_id
	has_many :events, :foreign_key => :client_id
	has_many :locations, through: :events
	has_many :categories, through: :locations
	has_many :orders, through: :categories
	has_many :items, through: :orders, :foreign_key => :client_id

	attr_accessor :address
	geocoded_by :address
after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
