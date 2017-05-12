class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	belongs_to :client
 	belongs_to :location, optional: true

 	geocoded_by :ip_address,
  :latitude => :latitude, :longitude => :longitude
after_validation :geocode
end
