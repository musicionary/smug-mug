class Crop < ActiveRecord::Base
  validates :country_of_origin, :elevation, :varietal, :harvest_date, :price, :ounces, presence: true
  validates :price, numericality: true
  validates :ounces, numericality: true
  belongs_to :farmer
  belongs_to :roaster
end
