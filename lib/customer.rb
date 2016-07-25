class Customer < ActiveRecord::Base
  validates :name, :street, :city, :state, :zip, :phone_number, :email, :password, :user_type, presence: true
  # validates :email, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :password, length: { minimum: 8}
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :phone_number, length: { in: 10..12 }
  has_and_belongs_to_many :roasts
end
