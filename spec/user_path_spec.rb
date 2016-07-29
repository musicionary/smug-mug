require 'spec_helper'

describe 'the user path', { type: :feature } do
  it 'should create a user' do
    visit '/'
    click_on 'Sign Up/Login'
    fill_in('name', :with => 'Noah')
    fill_in('email', :with => 'noah@example.com')
    fill_in('password', :with => '123456789')
    click_on('signup-button')
    expect(page).to have_content('What type of user are you?')
  end
end
