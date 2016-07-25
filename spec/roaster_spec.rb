require('spec_helper')

describe Roaster do
  it 'has many farmers' do
    test_roaster = Roaster.create(name: "Barista", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'barista@gmail.com', password: '123456789', user_type: 2)
    test_farmer = Farmer.create(name: "John Tims", email: 'john@tims.com', password: '123456789', user_type: 1)
    test_farmer2 = Farmer.create(name: "James Mikey", email: 'james@gmail.com', password: '123456789', user_type: 1)
    test_roaster.farmers.push(test_farmer)
    test_roaster.farmers.push(test_farmer2)
    expect(test_roaster.farmers()).to eq([test_farmer, test_farmer2])
  end
end
