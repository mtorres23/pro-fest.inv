class Bin < ApplicationRecord
  belongs_to :item
  belongs_to :location
end
