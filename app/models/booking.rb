class Booking

include DataMapper::Resource

property :id, Serial
property :confirmed, Boolean
property :rejected, Boolean, :default => false
property :from, Date
property :to, Date


belongs_to :listing
belongs_to :user

def total_price
  listing.price * (to - from)
end

end
