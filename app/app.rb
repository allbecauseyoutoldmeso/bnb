ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Bnb < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end


  get '/sessions/new' do
    if current_user
      flash.now[:logged_in_warning] = "You are already logged in"
      redirect to '/apartments'
    else
    erb :'sessions/log_in'
    end
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

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:log_out_notice] = "Successfully logged out"
    redirect to '/apartments'
  end
end

require_relative 'controllers/apartments'
require_relative 'controllers/bookings'
require_relative 'controllers/profile'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

