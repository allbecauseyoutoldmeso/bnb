require 'sinatra/base'

class Bnb < Sinatra::Base

get '/users/new' do
  erb :sign_up
end

post '/users' do
  redirect to '/apartments'
end

get '/apartments' do
end


end