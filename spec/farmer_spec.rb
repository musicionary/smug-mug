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
    test_farmer.roasters.push(test_roaster)
    test_farmer.roasters.push(test_roaster2)
    expect(test_farmer.roasters()).to eq([test_roaster, test_roaster2])
  end
end
