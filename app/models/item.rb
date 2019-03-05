class Item < ApplicationRecord
	belongs_to :bin, optional: true
	belongs_to :client, optional: true
end
