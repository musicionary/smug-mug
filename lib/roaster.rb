class Roaster < ActiveRecord::Base
  # validates :street, :city, :state, :zip, :phone_number, :user_id, presence: true
  # validates :zip, length: { is: 5 }, numericality: true
  # validates :phone_number, length: { in: 10..12 }
  validates :user_id, presence: true
  belongs_to :user
  has_many :roasts
end
