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
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)
    test_farmer2 = Farmer.create(name: "James Mikey", email: 'james@gmail.com', password: '123456789', user_type: 1)
    test_roaster.farmers.push(test_farmer)
    test_roaster.farmers.push(test_farmer2)
    expect(test_roaster.farmers()).to eq([test_farmer, test_farmer2])
  end
end
