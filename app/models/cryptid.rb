class Cryptid < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings

  def self.cryps_sightings 
    joins(:sightings).group('cryptids.name')
  end 
end
