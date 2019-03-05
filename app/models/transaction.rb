class Transaction < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :bin
end
