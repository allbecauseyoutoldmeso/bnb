module Helpers
  def create_user
    User.create(first_name: "Roi",
                last_name: "Driscoll",
                email: "roi@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
  end

  def create_listing
    Listing.create(name: "Makers",
                   description: "No toilets working",
                   price: "133",
                   user: User.first)
  end

  def create_booking
    Booking.create(confirmed:true,
                   from: '20/04/2017',
                   to: '22/04/2017',
                   listing: Listing.first,
                   user: User.first)
  end
end
