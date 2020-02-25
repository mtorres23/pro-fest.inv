class Upload < ApplicationRecord
    belongs_to :account
    belongs_to :event, optional: true
    belongs_to :location, optional: true
    validates_presence_of :url
end
