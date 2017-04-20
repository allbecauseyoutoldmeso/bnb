class Booking

include DataMapper::Resource

property :id, Serial
property :confirmed, Boolean
property :rejected, Boolean, :default => false
property :from, Date
property :to, Date


belongs_to :listing
belongs_to :user

def self.unavailable_dates(listing)
  unavailable_dates = []
  listing.bookings.each do |booking|
    (booking.from..booking.to).each { |date| unavailable_dates << date }
  end
  unavailable_dates
end

end
