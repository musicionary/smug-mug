require 'spec_helper'

describe 'the farmer path', { type: :feature } do
  it 'should create a farmer' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789")
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    click_on('farmer-button')
    fill_in('country', :with => 'Mexico')
    fill_in('farmer_city', :with => 'Mexico City')
    fill_in('elevation', :with => '1700m')
    fill_in('varietal', :with => 'Bourbon')
    fill_in('farmer_phone_number', :with => '503-234-5678')
    fill_in('crop_cost', :with => '18.99')
    fill_in('shipping_cost', :with => '8.99')
    click_on('farmer-signup')
    expect(Farmer.find_by(user_id: test_user.id).city).to eq('Mexico City')
  end

  it 'should show the farmer home page' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789", user_type: 'farmer')
    test_farmer = Farmer.create(country: 'Mexico', city: 'Mexico City', elevation: '1700m', varietal: 'Bourbon', phone_number: '503-234-5678', crop_cost: 18.99, shipping_cost: 8.99, user_id: test_user.id)
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    expect(page).to have_content('Mexico')
  end
end
