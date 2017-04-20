feature 'Confirm bookings' do

  before do
    full_cycle
    log_in
    visit('/profile/requests')
  end

  scenario 'user can see booking requests' do
    expect(page).to have_content("Makers")
  end

  scenario 'user can confirm booking' do
    click_button('Confirm booking')
    expect(page).to have_content('Booking confirmed')
  end

  scenario 'user can see is their booking request was confirmed' do
    click_button('Confirm booking')
    log_out
    log_in(email: "sam@makers.com")
    visit('profile/requests')
    expect(page).to have_content 'Booking confirmed'
  end

  scenario 'user can reject booking' do
    click_button('Reject booking')
    expect(page).not_to have_content('Makers')
  end

  scenario 'user can see their booking was rejected' do
    click_button('Reject booking')
    log_out
    log_in(email: "sam@makers.com")
    visit('profile/requests')
    expect(page).to have_content 'Booking rejected'
  end

end
