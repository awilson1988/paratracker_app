class Sighting < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cryptid, optional: true


end
