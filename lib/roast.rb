class Roast < ActiveRecord::Base
  validates :name, :price, :ounces, presence: true
  validates :price, numericality: true
  validates :ounces, numericality: true
  belongs_to :roaster
end
