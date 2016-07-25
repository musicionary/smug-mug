class Farmer < ActiveRecord::Base
  validates :name, :email, :password, :user_type, presence: true
  # validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :password, length: { minimum: 8}
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  has_many :crops
  has_many :roasters, through: :crops
end
