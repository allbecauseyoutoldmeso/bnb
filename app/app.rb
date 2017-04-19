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

require_relative 'controllers/apartments'
require_relative 'controllers/bookings'
require_relative 'controllers/profile'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
