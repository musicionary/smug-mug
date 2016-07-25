class Farmer
  has_many :crops
  has_many :roasters, through: :crops
end
