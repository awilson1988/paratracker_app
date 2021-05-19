class User < ApplicationRecord
  has_secure_password
  
  has_many :sightings 
  has_many :cryptids, through: :sightings

  validates_presence_of :email, :first_name
    
  validates :email, presence: true
  validates :password, length: {in: 5..30}, confirmation: true, on: :create  
  validates :username, uniqueness:{:message => "Username already exists."}, length: {in: 1..30}
end