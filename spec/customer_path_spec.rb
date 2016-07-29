require 'spec_helper'

describe 'the customer path', { type: :feature } do
  it 'should create a customer' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789")
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    click_on('customer-button')
    fill_in('customer_street', :with => '111 1st Ave')
    fill_in('customer_city', :with => 'Portland')
    fill_in('customer_state', :with => 'OR')
    fill_in('customer_zip', :with => '97219')
    fill_in('customer_phone_number', :with => '503-234-5678')
    click_on('customer-signup')
    expect(Customer.find_by(user_id: test_user.id).city).to eq('Portland')
  end

  it 'should show the customer home page' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789", user_type: 'customer')
    test_customer = Customer.create(street: '111 1st Ave', city: 'Portland', state: 'OR', zip: '97219', phone_number: '503-234-5678', user_id: test_user.id)
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    expect(page).to have_content('Jeff')
  end
end
