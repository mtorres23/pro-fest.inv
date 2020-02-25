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
	validates_presence_of :title
	before_validation :default_image

	geocoded_by :address
	after_validation :geocode

	def default_image
		if(self.photo_url == nil)
			title = URI.encode(self.title)
			self.photo_url = "https://via.placeholder.com/300/fff/000.png?text=#{title}"
		end
	end
end
