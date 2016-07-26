require('spec_helper')

describe Roaster do
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
  it 'should belong to a user' do
    test_user = User.create(name: "Bob", email: "bob@gmail.com", password: "Bob123")
    test_roaster = Roaster.create(street: "123 Main", city: "Portland", state: "OR", zip: "98765", phone_number: "555-123-1234", user_id: test_user.id)
    expect(test_roaster.user()).to eq(test_user)
  end

  # it 'should have many farmers' do
  #   test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: 98765, phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
  #   test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)
  #   test_farmer2 = Farmer.create(name: "James Mikey", email: 'james@gmail.com', password: '123456789', user_type: 1)
  #   expect(test_roaster.farmers()).to eq([test_farmer, test_farmer2])
  # end
  #
  # it 'should have many roasts' do
  #   test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
  #   test_roast = Roast.create(name: "Cat's Meow", price: 12.00, ounces: 16)
  #   test_roast2 = Roast.create(name: "Fuzz Buzz", price: 13.55, ounces: 16)
  #   test_roaster.roasts.push(test_roast)
  #   test_roaster.roasts.push(test_roast2)
  #   expect(test_roaster.roasts()).to eq([test_roast, test_roast2])
  # end
end
