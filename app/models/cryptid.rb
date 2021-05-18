class Cryptid < ApplicationRecord
  has_many :sightings
  has_many :users, through: :sightings

  validates :name, presence: true
  validates :description, presence: true

  def self.cryps_sightings 
    joins(:sightings).group('cryptids.name')
  end 
end
