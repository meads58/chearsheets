require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require_relative 'data_mapper_setup'



class TodoApp < Sinatra::Base

  set :views, Proc.new {File.join(root, "..", "views")}
  enable :sessions
  use Rack::Flash
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/user/new' do
   erb :signup
  end

  post '/user/new' do
    @user = User.create(username: params['username'], password: params['password'])

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect '/user/profile:id'
    else
      flash[:notice] = "User Not Saved"
      redirect '/'
    end

  end

  post '/user/session' do
    username, password = params['username'], params['password']
    @user = User.authenticate(username, password)
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}"
      redirect '/user/profile:id'
     else
      flash[:notice] = "User Not Found"
      redirect '/'
    end
  end

  get '/user/profile:id' do
    erb :user_profile
  end



# get '/:name' do
#   session[:name] = params['name']
#   redirect '/welcome'
#   # "Hello, #{session[:name]}!"
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
