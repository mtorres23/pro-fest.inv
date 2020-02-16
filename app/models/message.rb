class Message < ApplicationRecord
  belongs_to :location
  belongs_to :order
  belongs_to :event
  belongs_to :item
end
