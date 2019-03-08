class User < ActiveRecord::Base 
  has_many :eateries 
  has_secure_password
end 
