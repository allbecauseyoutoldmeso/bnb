class Listing
  include DataMapper::Resource

  property :id,                   Serial
  property :name,                 String, :unique => true
  property :description,          Text, :required => true
  property :price,                Integer, :required => true

  belongs_to :user
  has n, :bookings


end
