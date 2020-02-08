class Account < ApplicationRecord
    has_many :users, :foreign_key => :account_id
	has_many :events, :foreign_key => :account_id
    has_many :products
    has_many :customers

	geocoded_by :address
    after_validation :geocode

end
