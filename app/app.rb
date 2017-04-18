ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class Bnb < Sinatra::Base

get '/users/new' do
  erb :sign_up
end

post '/users/new' do
  @user = User.new(first_name: params[:first_name],
                   last_name: params[:last_name],
                   email: params[:email])
  @user.save
  redirect to '/apartments'
end

get '/apartments' do
  erb :apartments
end


end
