require 'bundler/setup'
Bundler.require(:default)
require 'pry'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

enable :sessions

# before do
#     @user = User.find(session[:id])
#   end

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

get '/account_signup' do
  @user = User.find(session[:id])
  erb :account_signup
end

post '/signup' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  @user = User.create(name: name, email: email, password: password)
  session[:id] = @user.id
  redirect '/account_signup'
end

post '/login' do
  email = params[:email]
  password = params[:password]
  @user = User.find_by(email: email, password: password)
  session[:id] = @user.id
  redirect '/user_home'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user_home' do
  @user = User.find(session[:id])
  @users = User.all
  if @user.user_type == "customer"
    @customer = Customer.find_by(user_id: @user.id)
    @farmers = Farmer.all
    @roasters = Roaster.all
  elsif @user.user_type == "roaster"
    @roaster = Roaster.find_by(user_id: @user.id)
    @farmers = Farmer.all
    @customers = Customer.all
    @roasts = Roast.all
  else
    @farmer = Farmer.find_by(user_id: @user.id)
    @roasters = Roaster.all
  end
  erb :user_home
end

# Can we make this form have all fields?
post '/user/customers' do
  @user = User.find(session[:id])
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @customer = Customer.create(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id)
  @user.update(user_type: "customer")
  redirect '/user_home'
end

post '/user/farmers' do
  @user = User.find(session[:id])
  country = params[:country]
  city = params[:city]
  phone_number = params[:phone_number]
  elevation = params[:elevation]
  varietal = params[:varietal]
  crop_cost = params[:crop_cost]
  shipping_cost = params[:shipping_cost]
  @farmer = Farmer.create(country: country, city: city, phone_number: phone_number, elevation: elevation, varietal: varietal, crop_cost: crop_cost, shipping_cost: shipping_cost, user_id: @user.id)
  @user.update(user_type: "farmer")
  redirect '/user_home'
end

post '/user/roasters' do
  @user = User.find(session[:id])
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @roaster = Roaster.create(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id)
  @user.update(user_type: "roaster")
  redirect '/user_home'
end


################################
#customers
###############################

get('/customer/edit') do
  @user = User.find(session[:id])
  @customer = Customer.find_by(user_id: @user.id)
  erb :user_edit
end

patch '/customer' do
  @user = User.find(session[:id])
  @customer = Customer.find_by(user_id: @user.id)
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @customer.update(street: street, city: city, state: state, zip: zip, phone_number: phone_number)
  redirect "/user_home"
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
