class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true 
end
