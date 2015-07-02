require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require_relative 'data_mapper_setup'
require 'net/http'
require 'json'
# require 'active_support/core_ext'
require 'active_support/all'
require 'open-uri'


class TodoApp < Sinatra::Base

  url = 'http://rates.fxcm.com/RatesXML'
  resp = Net::HTTP.get_response(URI.parse(url))
  body = resp.body

  doc = Nokogiri::HTML(open(url))
  #Hash.from_xml(resp).to_json
  # get_response takes an URI object


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
      redirect '/user/profile:from/:to'
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

  get '/user/profile:from/:to' do
    @data = doc
    erb :user_profile
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end






