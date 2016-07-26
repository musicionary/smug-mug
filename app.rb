require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

enable :sessions

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

get '/users/home' do
  @user = User.find(session[:id])
  erb :user_index
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

get('/logout') do
  session.clear
  redirect '/'
end
