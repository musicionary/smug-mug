require('spec_helper')

describe Roaster do
  it "validates presence of name" do
    roaster = Roaster.new({:name => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of street" do
    roaster = Roaster.new({:street => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of city" do
    roaster = Roaster.new({:city => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of state" do
    roaster = Roaster.new({:state => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of zip" do
    roaster = Roaster.new({:zip => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of phone_number" do
    roaster = Roaster.new({:phone_number => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of email" do
    roaster = Roaster.new({:email => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of password" do
    roaster = Roaster.new({:password => ""})
    expect(roaster.save()).to(eq(false))
  end
  it "validates presence of user_type" do
    roaster = Roaster.new({:user_type => ""})
    expect(roaster.save()).to(eq(false))
  end

  it 'should have many farmers' do
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: 98765, phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)
    test_farmer2 = Farmer.create(name: "James Mikey", email: 'james@gmail.com', password: '123456789', user_type: 1)
    test_crop = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer.id(), roaster_id: test_roaster.id())
    test_crop2 = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer2.id(), roaster_id: test_roaster.id())
    expect(test_roaster.farmers()).to eq([test_farmer, test_farmer2])
  end

  # it 'should have many roasts' do
  #   test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
  #   test_roast = Roast.create(name: "Cat's Meow", price: 12.00, ounces: 16)
  #   test_roast2 = Roast.create(name: "Fuzz Buzz", price: 13.55, ounces: 16)
  #   test_roaster.roasts.push(test_roast)
  #   test_roaster.roasts.push(test_roast2)
  #   expect(test_roaster.roasts()).to eq([test_roast, test_roast2])
  # end
end
