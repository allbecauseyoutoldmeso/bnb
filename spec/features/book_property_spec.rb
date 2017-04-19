feature 'User books a property' do
  xscenario 'select a property' do
    Listing.create(name: "Makers", description: "No toilets working", price: "133")
    sign_up
    click_link "Makers"
    expect(current_path).to eq('booking/Makers')
    expect(page).to have_content("Makers")
    expect(page).to have_content("Pick a night")
  end

  scenario 'request a property for certain dates' do
    Listing.create(name: "Makers", description: "No toilets working", price: "133")
    sign_up
    visit('/booking/Makers')
    fill_in :from, with: '19/04/2017'
    fill_in :to, with: '22/04/2017'
    click_button 'Request booking'
    expect(current_path).to eq '/requests'
    expect(Booking.count).to eq(1)
    expect(page).to have_content "Makers"
  end
end
