class Bnb < Sinatra::Base

  get '/profile/requests' do
    erb :'profile/requests'
  end

  post '/profile/requests/confirm' do
    booking = Booking.get(params[:booking_id])
    booking.update(:confirmed => true)
    redirect '/profile/requests'
  end

  post '/profile/requests/reject' do
    booking = Booking.get(params[:booking_id])
    booking.update(:rejected => true)
    redirect '/profile/requests'
  end

  get '/profile/requests/made/:id' do
    @booking = Booking.get(params[:id])
    erb :'profile/booking_made'
  end

  get '/profile/requests/received/:id' do
    @booking = Booking.get(params[:id])
    erb :'profile/booking_received'
  end

end
