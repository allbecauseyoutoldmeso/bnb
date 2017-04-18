ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Bnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

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

  get '/apartments' do
    @user = User.first(id: session[:user_id])
    erb :apartments
  end

  get '/sessions/new' do
    erb :'sessions/log_in'
  end

  post '/sessions' do
    empty_params 
    if User.authentic?(params[:email], params[:password])
      user = User.first(email: params[:email])
      session[:user_id] = user.id
      redirect to '/apartments'
    else
      flash.next[:error] = "Invalid username or password"
      redirect '/sessions/new'
    end
  end

  helpers do

    def empty_params
      if params[:email].empty? || params[:password].empty?
        flash.next[:error] = "Please enter an email and password"
        redirect '/sessions/new'
      end
    end

  end

end
