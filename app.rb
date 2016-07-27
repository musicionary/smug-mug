require 'bundler/setup'
Bundler.require(:default)
require 'pry'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

enable :sessions

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

get '/users/home' do
  @users = User.all
  @user = User.find(session[:id])
  erb :user_home
end

post '/signup' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  @user = User.create(name: name, email: email, password: password)
  session[:id] = @user.id
  redirect '/users/home'
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  @user = User.find_by(email: email, password: password)
  session[:id] = @user.id
  redirect '/users/home'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/user/customers' do
  @user = User.find(session[:id])
  @customer = Customer.create(user_id: @user.id)
  @user.update(user_type: "customer")
  binding.pry
  redirect '/users/home'
end

post '/user/farmers' do
  @user = User.find(session[:id])
  @farmer = Farmer.create(user_id: @user.id)
  @user.update(user_type: "farmer")
  redirect '/users/home'
end

post '/user/roasters' do
  @user = User.find(session[:id])
  @roaster = Roaster.create(user_id: @user.id)
  @user.update(user_type: "roaster")
  redirect '/users/home'
end


################################
#customers
###############################

get '/customers/new' do
  erb :customer_form
end

get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb :customer
end

post '/customers' do
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @customer = Customer.create(street: street, city: city, state: state, zip:zip, phone_number: phone_number)
  redirect "/customers"
end

patch '/customers/:id' do
  @customer = Customer.find(params[:id])
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @customer.update(street: street, city: city, state: state, zip:zip, phone_number: phone_number)
  redirect "/customers/#{@customer.id}"
end

delete '/customers/:id' do
  @customer = Customer.find(params[:id])
  @customer.destroy
  redirect '/customers'
end

################################
#roasters
###############################
get '/roasters/new' do
  erb :roaster_form
end

get '/roasters/:id' do
  @roaster = Roaster.find(params[:id])
  erb :roaster
end

post '/roasters' do
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @roaster = Roaster.create(street: street, city: city, state: state, zip:zip, phone_number: phone_number)
  redirect "/roasters"
end

patch '/roasters/:id' do
  @roaster = Roaster.find(params[:id])
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @roaster.update(street: street, city: city, state: state, zip:zip, phone_number: phone_number)
  redirect "/roasters/#{@roaster.id}"
end

delete '/roasters/:id' do
  @roaster = Roaster.find(params[:id])
  @roaster.destroy
  redirect '/roasters'
end

################################
#farmers
###############################
get '/farmers/new' do
  erb :farmer_form
end

get '/farmers/:id' do
  @farmer = Farmer.find(params[:id])
  erb :farmer
end

post '/farmers' do
  phone_number = params[:phone_number]
  country = params[:country]
  city = params[:city]
  elevation = params[:elevation]
  varietal = params[:varietal]
  crop_cost = params[:crop_cost]
  shipping_cost = params[:shipping_cost]
  @farmer = Farmer.create(phone_number: phone_number, country: country, city: city, elevation: elevation, varietal: varietal, crop_cost: crop_cost, shipping_cost: shipping_cost)
  redirect "/farmers"
end

patch '/farmers/:id' do
  @farmer = Farmer.find(params[:id])
  phone_number = params[:phone_number]
  country = params[:country]
  city = params[:city]
  elevation = params[:elevation]
  varietal = params[:varietal]
  crop_cost = params[:crop_cost]
  shipping_cost = params[:shipping_cost]
  @farmer.update(phone_number: phone_number, country: country, city: city, elevation: elevation, varietal: varietal, crop_cost: crop_cost, shipping_cost: shipping_cost)
  redirect "/farmers/#{@farmer.id}"
end

delete '/farmers/:id' do
  @farmer = Farmer.find(params[:id])
  @farmer.destroy
  redirect('/farmers')
end

################################
#roasts
###############################
get '/roasts/new' do
  erb :roast_form
end

post '/roasts' do
  name = params[:name]
  roast_date = params[:roast_date]
  roast_type = params[:roast_type]
  notes = params[:notes]
  price = params[:price]
  ounces = params[:ounces]
  @roast = Roast.create(name: name, roast_date: roast_date, roast_type: roast_type, notes: notes, price: price, ounces: ounces)
  redirect "/roasts"
end

patch '/roasts/:id' do
  @roast = Roast.find(params[:id])
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @roast.update(name: name, roast_date: roast_date, roast_type: roast_type, notes: notes, price: price, ounces: ounces)
  redirect "/roasts/#{@roast.id}"
end

delete '/roasts/:id' do
  @roast = Roast.find(params[:id])
  @roast.destroy
  redirect '/roasts'
end
