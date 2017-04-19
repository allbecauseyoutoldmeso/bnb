class Booking

include DataMapper::Resource

property :id, Serial
property :confirmed, Boolean
property :from, Date
property :to, Date


belongs_to :listing
belongs_to :user

end
