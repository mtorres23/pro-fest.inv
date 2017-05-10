class Item < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :location, optional: true
	belongs_to :client, optional: true
end
