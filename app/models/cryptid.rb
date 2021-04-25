class Cryptid < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings
end
