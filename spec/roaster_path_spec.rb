require 'spec_helper'

describe 'the roaster path', { type: :feature } do
  it 'should create a roaster' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789")
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    click_on('roaster-button')
    fill_in('roaster_street', :with => '111 1st Ave')
    fill_in('roaster_city', :with => 'Portland')
    fill_in('roaster_state', :with => 'OR')
    fill_in('roaster_zip', :with => '97219')
    fill_in('roaster_phone_number', :with => '503-234-5678')
    click_on('roaster-signup')
    expect(Roaster.find_by(user_id: test_user.id).city).to eq('Portland')
  end

  it 'should show the roaster home page' do
    test_user = User.create(name: "Jeff", email: "jeff@jeff.com", password: "123456789", user_type: 'roaster')
    test_customer = Roaster.create(street: '111 1st Ave', city: 'Portland', state: 'OR', zip: '97219', phone_number: '503-234-5678', user_id: test_user.id)
    visit '/signup'
    click_on('Log In')
    fill_in('login-email', :with => 'jeff@jeff.com')
    fill_in('login-password', :with => '123456789')
    click_on('login-button')
    expect(page).to have_content('Portland')
  end
end
