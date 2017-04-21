feature 'reviewing my bookings' do

  scenario 'see a single booking' do
      full_cycle
      log_in(email: "sam@makers.com")
      visit '/profile/requests'
      click_link('Makers')
      expect(current_path).to eq("/profile/requests/#{Booking.first.id}")
      expect(page).to have_content('Fantastic new kitchen')
      expect(page).to have_css('#message_button')
  end

end
