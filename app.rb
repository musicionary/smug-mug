require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/customer/:id') do
  @customer = Customer.find(params[:id])
  erb(:customer)
end

get('/roasters') do
  @roasters = Roaster.all()
  erb(:roasters)
end

get('/roaster/:id') do
  @roaster = Roaster.find(params[:id])
  erb(:roaster)
end

get('/farmers') do
  @farmers = Farmer.all()
  erb(:farmers)
end

get('/farmer/:id') do
  @farmer = Farmer.find(params[:id])
  erb(:farmer)
end

get('/roasts') do
  @roasts = Roast.all()
  erb(:roasts)
end

get('/roasts/:id') do
  @roast = Roast.find(params[:id])
  erb(:roast)
end

get('/crops') do
  @crops = Crop.all()
  erb(:crops)
end

get('/crops/:id') do
  @crop = Crop.find(params[:id])
  erb(:crop)
end
