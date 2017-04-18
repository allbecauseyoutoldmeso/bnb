ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Bnb < Sinatra::Base
  register Sinatra::Flash

  enable :sessions

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation])
  if @user.save
    redirect to '/apartments'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :sign_up
  end
end

get '/apartments' do
  @user = User.first(id: session[:user_id])
  erb :apartments
end

get '/sessions/log_in' do
  erb :'sessions/log_in'
end

post '/sessions/log_in' do
  user = User.first(email: params[:email])
  session[:user_id] = user.id
  redirect to '/apartments'
end

end
