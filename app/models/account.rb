class Account < ApplicationRecord
    has_many :users
    has_many :products
    has_many :items
    has_many :customers

    attr_accessor :address
	geocoded_by :address
after_validation :geocode
end
