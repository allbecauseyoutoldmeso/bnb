feature 'Confirm bookings' do
  scenario 'user can see booking requests' do
    User.create(first_name: "Roi",
                last_name: "Driscoll",
                email: "roi@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Listing.create(name: "Makers", description: "No toilets working", price: "133", user: User.first)
    User.create(first_name: "Sam",
                last_name: "Driscoll",
                email: "sam@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Booking.create(confirmed: false, from: "04/12/2017", to: "07/12/2017", listing: Listing.first, user: User.last)
    log_in
    visit('/profile/requests')
    expect(page).to have_content("Makers")
  end

  scenario 'user can confirm booking' do
    User.create(first_name: "Roi",
                last_name: "Driscoll",
                email: "roi@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Listing.create(name: "Makers", description: "No toilets working", price: "133", user: User.first)
    User.create(first_name: "Sam",
                last_name: "Driscoll",
                email: "sam@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Booking.create(confirmed: false, from: "04/12/2017", to: "07/12/2017", listing: Listing.first, user: User.last)
    log_in
    visit('/profile/requests')
    click_button('Confirm booking')
    expect(page).to have_content('Booking confirmed')
  end

  scenario 'user can see is their booking request was confirmed' do
    User.create(first_name: "Roi",
                last_name: "Driscoll",
                email: "roi@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Listing.create(name: "Makers", description: "No toilets working", price: "133", user: User.first)
    User.create(first_name: "Sam",
                last_name: "Driscoll",
                email: "sam@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    Booking.create(confirmed: false, from: "04/12/2017", to: "07/12/2017", listing: Listing.first, user: User.last)
    log_in
    visit('/profile/requests')
    click_button('Confirm booking')
    visit('/apartments')
    click_button 'Log out'
    log_in(email: "sam@makers.com")
    visit('profile/requests')
    expect(page).to have_content 'Booking confirmed'
  end

end
