class Listing
  include DataMapper::Resource

  property :id,                   Serial
  property :name,                 String
  property :description,          Text
  property :price,                Integer

  belongs_to :user
  has n, :bookings


end
