class Sighting < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true
  belongs_to :cryptid

  validates :account, presence: true 
  validates :date, presence: true  
  validates :location, presence: true 



end
