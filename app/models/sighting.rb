class Sighting < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cryptid, optional: true

  validates :account, presence: true


end
