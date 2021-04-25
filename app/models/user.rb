class User < ApplicationRecord
  has_secure_password
  has_many :sightings 
  has_many :cryptids, through: :sightings
end
