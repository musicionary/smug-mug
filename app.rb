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

################################
#user sessions
###############################
get '/signup' do
  erb :signup_login
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
  email = params['login-email']
  password = params['login-password']
  @user = User.find_by(email: email, password: password)
  session[:id] = @user.id
  redirect '/user_home'
end

get '/logout' do
  session.clear
  redirect '/'
end

################################
#READ
###############################
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
  elsif @user.user_type == "farmer"
    @farmer = Farmer.find_by(user_id: @user.id)
    @roasters = Roaster.all
  else
    redirect '/account_signup'
  end
  erb :user_home
end

#############
# farmer ordering #
##############

get '/farmers' do
  @farmers = Farmer.all()
  erb :farmers
end

get '/farmers/country' do
  @farmers = Farmer.order(:country)
  erb :farmers
end

get '/farmers/elevation' do
  @farmers = Farmer.order(:elevation)
  erb :farmers
end

get '/farmers/city' do
  @farmers = Farmer.order(:city)
  erb :farmers
end

get '/farmers/varietal' do
  @farmers = Farmer.order(:varietal)
  erb :farmers
end

####################

get '/roasters' do
  @users = User.all
  @roasters = Roaster.all()
  erb :roasters
end

get '/roaster/:roaster_id' do
  @roasts = Roast.all()
  @farmers = Farmer.all()
  @roaster = Roaster.find(params[:roaster_id])
  erb :roaster
end

################################
#CREATE
###############################
post '/user/customers' do
  @user = User.find(session[:id])
  street = params[:customer_street]
  city = params[:customer_city]
  state = params[:customer_state]
  zip = params[:customer_zip]
  phone_number = params[:customer_phone_number]
  @customer = Customer.create(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id)
  @user.update(user_type: "customer")
  redirect '/user_home'
end

post '/user/farmers' do
  @user = User.find(session[:id])
  country = params[:country]
  city = params[:farmer_city]
  phone_number = params[:farmer_phone_number]
  elevation = params[:elevation]
  varietal = params[:varietal]
  crop_cost = params[:crop_cost]
  shipping_cost = params[:shipping_cost]
  @farmer = Farmer.create(country: country, city: city, phone_number: phone_number, elevation: elevation, varietal: varietal, crop_cost: crop_cost, shipping_cost: shipping_cost, user_id: @user.id, image_url: 'grower-image_1.jpg')
  @user.update(user_type: "farmer")
  redirect '/user_home'
end

post '/user/roasters' do
  @user = User.find(session[:id])
  street = params[:roaster_street]
  city = params[:roaster_city]
  state = params[:roaster_state]
  zip = params[:roaster_zip]
  phone_number = params[:roaster_phone_number]
  @roaster = Roaster.create(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id, image_url: 'grower-image_1.jpg')
  @user.update(user_type: "roaster")
  redirect '/user_home'
end


################################
#EDIT
###############################

get('/user_edit') do
  @user = User.find(session[:id])
  if @user.user_type == "customer"
    @customer = Customer.find_by(user_id: @user.id)
  elsif @user.user_type == "roaster"
    @roaster = Roaster.find_by(user_id: @user.id)
  else
    @farmer = Farmer.find_by(user_id: @user.id)
  end
  erb :user_edit
end

patch '/user/customers' do
  @user = User.find(session[:id])
  @customer = Customer.find_by(user_id: @user.id)
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @customer.update(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id)
  @user.update(user_type: "customer")
  redirect '/user_home'
end

patch '/user/farmers' do
  @user = User.find(session[:id])
  @farmer = Farmer.find_by(user_id: @user.id)
  country = params[:country]
  city = params[:city]
  phone_number = params[:phone_number]
  elevation = params[:elevation]
  varietal = params[:varietal]
  crop_cost = params[:crop_cost]
  shipping_cost = params[:shipping_cost]
  @farmer.update(country: country, city: city, phone_number: phone_number, elevation: elevation, varietal: varietal, crop_cost: crop_cost, shipping_cost: shipping_cost, user_id: @user.id)
  @user.update(user_type: "farmer")
  redirect '/user_home'
end

patch '/user/roasters' do
  @user = User.find(session[:id])
  @roaster = Roaster.find_by(user_id: @user.id)
  street = params[:street]
  city = params[:city]
  state = params[:state]
  zip = params[:zip]
  phone_number = params[:phone_number]
  @roaster.update(street: street, city: city, state: state, zip: zip, phone_number: phone_number, user_id: @user.id)
  @user.update(user_type: "roaster")
  redirect '/user_home'
end

################################
#DELETE
###############################

delete '/user/customers' do
  @user = User.find(session[:id])
  @customer = Customer.find_by(user_id: @user.id)
  @customer.destroy
  @user.destroy
  session.clear
  redirect '/'
end


delete '/user/roasters' do
  @user = User.find(session[:id])
  @roaster = Roaster.find_by(user_id: @user.id)
  @roaster.destroy
  @user.destroy
  session.clear
  redirect '/'
end


delete '/user/farmers' do
  @user = User.find(session[:id])
  @farmer = Farmer.find_by(user_id: @user.id)
  @farmer.destroy
  @user.destroy
  session.clear
  redirect '/'
end

################################
#roasts
###############################
get '/roasts' do
  @roasts = Roast.all()
  erb :roasts
end

get '/roasts/new' do
  erb :roast_form
end

post '/roasts' do
  @farmers = Farmer.all()
  @user = User.find(session[:id])
  @roaster = Roaster.find_by(user_id: @user.id)
  name = params[:name]
  roast_date = params[:roast_date]
  roast_type = params[:roast_type]
  notes = params[:notes]
  price = params[:price]
  ounces = params[:ounces]
  farmer_id = params[:farmer_id]
  description = params[:description]
  @roast = Roast.create(name: name, roast_date: roast_date, roast_type: roast_type, notes: notes, price: price, ounces: ounces, roaster_id: @roaster.id, farmer_id: farmer_id, description: description, image_url: "coffee_bag_6.jpg")
  redirect "/roasts"
end

delete '/roasts/:id' do
  @roast = Roast.find(params[:id])
  @roast.destroy
  redirect '/roasts'
end
