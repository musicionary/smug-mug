require('spec_helper')

describe Roast do
  it "validates presence of name" do
    roast = Roast.new({:name => ""})
    expect(roast.save()).to(eq(false))
  end
  it "validates presence of price" do
    roast = Roast.new({:price => nil})
    expect(roast.save()).to(eq(false))
  end
  it "validates presence of ounces" do
    roast = Roast.new({:ounces => nil})
    expect(roast.save()).to(eq(false))
  end
  it 'should belong to a Roaster' do
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_roast = Roast.create({name: "Cat's Meow", price: 12.00, ounces: 16, roaster_id: test_roaster.id()})
    expect(test_roast.roaster()).to eq(test_roaster)
  end

  it 'should show the origin crop' do
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)

    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)

    test_crop = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer.id(), roaster_id: test_roaster.id())

    test_roast = Roast.create({name: "Cat's Meow", price: 12.00, ounces: 16, roaster_id: test_roaster.id(), crop_id: test_crop.id()})

    expect(test_roast.roaster.crops).to eq([test_crop])
  end
end
