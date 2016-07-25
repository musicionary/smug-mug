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
    # binding.pry
    expect(test_roast.roaster()).to eq(test_roaster)
  end
end
