require('spec_helper')

describe Crop do
  it "validates presence of country origin" do
    crop = Crop.new({:country_of_origin => ""})
    expect(crop.save()).to(eq(false))
  end
  it "validates presence of elevation" do
    crop = Crop.new({:elevation => "nil"})
    expect(crop.save()).to(eq(false))
  end
  it "validates presence of varietal" do
    crop = Crop.new({:varietal => "nil"})
    expect(crop.save()).to(eq(false))
  end
  it "validates presence of harvest date" do
    crop = Crop.new({:harvest_date => ""})
    expect(crop.save()).to(eq(false))
  end
  it "validates presence of price" do
    crop = Crop.new({:price => nil})
    expect(crop.save()).to(eq(false))
  end
  it "validates presence of ounces" do
    crop = Crop.new({:ounces => nil})
    expect(crop.save()).to(eq(false))
  end
  it 'should have a farmer' do
    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)

    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)

    test_crop = Crop.create(country_of_origin: "Uganda", elevation: "400 meters", varietal: "Harar", harvest_date: '2000-01-01', price: 400.00, ounces: 400, farmer_id: test_farmer.id(), roaster_id: test_roaster.id())

    expect(test_crop.farmer()).to eq(test_farmer)
  end
end
