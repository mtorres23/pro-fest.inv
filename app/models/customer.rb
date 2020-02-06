class Customer < ApplicationRecord
    belongs_to :account
    has_many :events

    attr_accessor :address
	geocoded_by :address
	after_validation :geocode
  end
