ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Bnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.new(first_name: params[:first_name],
                     last_name: params[:last_name],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/apartments'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/sign_up'
    end
  end

  get '/apartments/new' do
    erb :'apartments/new'
  end

  get '/apartments' do
    @listings = Listing.all
    erb :'apartments/index'
  end

  post '/apartments' do
    @listing = Listing.new(name: params[:property_name],
                          description: params[:description],
                          price: params[:price],
                          user: current_user)
    if @listing.save
      redirect to '/apartments'
    else
      flash.now[:listing_error] = "You have already listed this property"
    end
end

  get '/sessions/new' do
    erb :'sessions/log_in'
  end

  post '/sessions' do
    if User.authentic?(params[:email], params[:password])
      user = User.first(email: params[:email])
      session[:user_id] = user.id
      redirect to '/apartments'
    else
      flash.next[:error] = "Invalid username or password"
      redirect '/sessions/new'
    end
  end
end
