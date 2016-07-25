class Roaster < ActiveRecord::Base
  has_many :crops
  has_many :farmers, through: :crops
end
