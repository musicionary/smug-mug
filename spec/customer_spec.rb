require('spec_helper')

describe Customer do
  it "validates presence of name" do
    customer = Customer.new({:name => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of street" do
    customer = Customer.new({:street => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of city" do
    customer = Customer.new({:city => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of state" do
    customer = Customer.new({:state => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of zip" do
    customer = Customer.new({:zip => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of phone_number" do
    customer = Customer.new({:phone_number => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of email" do
    customer = Customer.new({:email => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of password" do
    customer = Customer.new({:password => ""})
    expect(customer.save()).to(eq(false))
  end
  it "validates presence of user_type" do
    customer = Customer.new({:user_type => ""})
    expect(customer.save()).to(eq(false))
  end

  it 'should have many roasts' do
    test_customer = Customer.create(name: "Jim John", street: '123 Main Street', city: 'Portland', state: 'OR', zip: '98765', phone_number: '555-123-1234', email: 'jimmy@gmail.com', password: '123456789', user_type: 2)
    test_roast = Roast.create(name: "Cat's Meow", price: 12.00, ounces: 16)
    test_roast2 = Roast.create(name: "Fuzz Buzz", price: 13.55, ounces: 16)
    test_customer.roasts.push(test_roast)
    test_customer.roasts.push(test_roast2)
    expect(test_customer.roasts()).to eq([test_roast, test_roast2])
  end
end
