class Farmer < ActiveRecord::Base
  validates :country, :phone_number, :city, :elevation, :varietal, :crop_cost, :shipping_cost, presence: true
  belongs_to :user
end
