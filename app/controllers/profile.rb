class Bnb < Sinatra::Base

  get '/profile/requests' do
    erb :'profile/requests'
  end

  post '/profile/requests/confirm' do
    booking = Booking.first(params[:booking_id])
    booking.confirmed = true
    booking.save
    redirect '/profile/requests'
  end
  
end
