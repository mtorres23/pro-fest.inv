class Customer < ApplicationRecord
    belongs_to :account
    has_many :events

	  geocoded_by :address
	  after_validation :geocode
  end
