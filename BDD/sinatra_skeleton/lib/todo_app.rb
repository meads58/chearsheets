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

  post '/user' do
    user = User.create(username: params['username'], password: params['password'])
    session[:user] = user.id
    if user.id
      flash[:notice] = "Welcome #{session[:user]}"
      flash[:notice] = "User Not Found"
      redirect '/'
  end

  get '/user/new' do
   erb :signup
  end



# get '/:name' do
#   session[:name] = params['name']
#   redirect '/welcome'
#   # "Hello, #{session[:name]}!"
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
