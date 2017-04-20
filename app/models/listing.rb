class Listing
  include DataMapper::Resource

  property :id,                   Serial
  property :name,                 String, :unique => true
  property :description,          Text, :required => true
  property :price,                Integer, :required => true

  belongs_to :user
  has n, :bookings

  def unavailable_dates
    unavailable_dates = []
    bookings.each do |booking|
      (booking.from..booking.to).each { |date| unavailable_dates << date }
    end
    unavailable_dates
  end


end
