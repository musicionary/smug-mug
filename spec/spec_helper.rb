ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require './app'

RSpec.configure do |config|
  config.before(:each) do
    User.all.each do |user|
      user.destroy
    end
    Farmer.all.each do |farmer|
      farmer.destroy
    end
    Roaster.all.each do |roaster|
      roaster.destroy
    end
    Customer.all.each do |customer|
      customer.destroy
    end
  end

  config.after(:each) do
    User.all.each do |user|
      user.destroy
    end
    Farmer.all.each do |farmer|
      farmer.destroy
    end
    Roaster.all.each do |roaster|
      roaster.destroy
    end
    Customer.all.each do |customer|
      customer.destroy
    end
  end
end
