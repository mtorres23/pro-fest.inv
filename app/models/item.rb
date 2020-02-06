class Item < ApplicationRecord
	belongs_to :bin, optional: true
end
