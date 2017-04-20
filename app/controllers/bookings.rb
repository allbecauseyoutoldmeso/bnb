class Bnb < Sinatra::Base

  get '/booking/:name' do
    @listing = Listing.first(name: params[:name])
    erb :'booking/index'
  end

  post '/booking' do
    Booking.create(confirmed: false,
                   from: params[:from],
                   to: params[:to],
                   listing: Listing.first(params[:listing_id]),
                   user: current_user)
    redirect to '/profile/requests'
  end
end
