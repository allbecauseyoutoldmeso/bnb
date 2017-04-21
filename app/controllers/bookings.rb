class Bnb < Sinatra::Base

  get '/booking/:name' do
    @listing = Listing.first(name: params[:name])
    erb :'booking/index'
  end

  post '/booking' do
    selected_dates =[]
    (Date.parse(params[:from])..Date.parse(params[:to])).each { |date| selected_dates << date }
    if (Listing.first(params[:listing_id]).unavailable_dates & selected_dates).empty?
      Booking.create(confirmed: false,
                     from: params[:from],
                     to: params[:to],
                     listing: Listing.get(params[:listing_id]),
                     user: current_user)
      redirect to '/profile/requests'
    end
  end
end
