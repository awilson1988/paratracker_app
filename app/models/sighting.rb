class Sighting < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cryptid, optional: true

  validates :account, presence: true 
  validates :date, presence: true  
  validates :location, presence: true 



end
