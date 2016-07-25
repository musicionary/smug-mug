class Farmer < ActiveRecord::Base
  has_many :crops
  has_many :roasters, through: :crops
end
