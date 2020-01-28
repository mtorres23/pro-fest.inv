class Assignment < ApplicationRecord
  belongs_to :event
  belongs_to :location
  belongs_to :user
end
