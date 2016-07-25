class Roaster
  has_many :crops
  has_many :farmers, through: :crops
end
