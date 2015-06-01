class User < ActiveRecord::Base
  has_many :characters
  
  has_secure_password

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 25 }
  validates :character_name, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true
end
