class User < ActiveRecord::Base
  has_many :characters
  
  has_secure_password

  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 25 }
  validates :email, :presence => true
end
