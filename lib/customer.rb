class Customer < ActiveRecord::Base
  validates :street, :city, :state, :zip, :phone_number, :user_id, presence: true
  validates :zip, length: { is: 5 }, numericality: true
  validates :phone_number, length: { in: 10..12 }
  belongs_to :user
end
