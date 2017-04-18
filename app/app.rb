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

  get '/apartments' do
    erb :'apartments/index'
  end

  get '/apartments/new' do
    erb :'apartments/new'
  end

  get '/sessions/new' do
    erb :'sessions/log_in'
  end

  post '/sessions' do
    user = User.first(email: params[:email])
    session[:user_id] = user.id
    redirect to '/apartments'
  end
end
