class Bnb < Sinatra::Base

  get '/apartments/new' do
    erb :'apartments/new'
  end

  get '/apartments' do
    @listings = Listing.all
    erb :'apartments/index'
  end
  
  post '/apartments' do
    @listing = Listing.new(name: params[:property_name],
                          description: params[:description],
                          price: params[:price],
                          user: current_user)
    if @listing.save
      redirect to '/apartments'
    else
      flash.now[:listing_error] = "You have already listed this property"
    end
  end
end
