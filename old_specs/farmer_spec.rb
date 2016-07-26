require('spec_helper')

describe Farmer do
  it "validates presence of country" do
    farmer = Farmer.new({:country => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of city" do
    farmer = Farmer.new({:city => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of elevation" do
    farmer = Farmer.new({:elevation => ""})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of varietal" do
    farmer = Farmer.new({:varietal => nil})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of phone number" do
    farmer = Farmer.new({:phone_number => nil})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of crop cost" do
    farmer = Farmer.new({:crop_cost => nil})
    expect(farmer.save()).to(eq(false))
  end
  it "validates presence of shipping cost" do
    farmer = Farmer.new({:shipping_cost => nil})
    expect(farmer.save()).to(eq(false))
  end
  it 'should belong to a user' do
    test_user = User.create(name: "Bob", email: "bob@gmail.com", password: "Bob123")
    test_farmer = Farmer.create(country: "Uganda", city: "Lusake", elevation: "1234", varietal: "Bourbon", phone_number: "555-123-1234", crop_cost: 12.99, shipping_cost: 1800, user_id: test_user.id)
    expect(test_farmer.user()).to eq(test_user)
  end
end
