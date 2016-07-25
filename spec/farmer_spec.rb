require('spec_helper')

describe Farmer do
  it "validates presence of name" do
    farmer = Farmer.new({:name => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of email" do
    farmer = Farmer.new({:email => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of password" do
    farmer = Farmer.new({:password => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of user type" do
    farmer = Farmer.new({:user_type => nil})
    expect(farmer.save()).to(eq(false))
  end
  it 'should have many roasters' do
    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_roaster2 = Roaster.create(name: "Heart", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_crop = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer.id(), roaster_id: test_roaster.id())
    test_crop2 = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer.id(), roaster_id: test_roaster2.id())
    expect(test_farmer.roasters()).to eq([test_roaster, test_roaster2])
  end
end
