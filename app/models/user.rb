class User < ApplicationRecord
  has_secure_password
  
  has_many :sightings 
  has_many :cryptids, through: :sightings

  validates_uniqueness_of :username
  validates_presence_of :username, :email, :first_name, :last_name 
  # validates_length_of :password, length: {in: 5..15}, confirmation: true, on: :create  
end