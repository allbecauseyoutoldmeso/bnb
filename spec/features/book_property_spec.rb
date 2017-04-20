feature 'User books a property' do
  xscenario 'select a property' do
    Listing.create(name: "Makers", description: "No toilets working", price: "133", user: User.first)
    sign_up
    click_link "Makers"
    expect(current_path).to eq('booking/Makers')
    expect(page).to have_content("Makers")
    expect(page).to have_content("Pick a night")
  end

  scenario 'request a property for certain dates' do
    sign_up
    Listing.create(name: "Makers", description: "No toilets working", price: "133", user: User.first)
    visit('/booking/Makers')
    fill_in :from, with: '19/04/2017'
    fill_in :to, with: '22/04/2017'
    click_button 'Request booking'
    expect(current_path).to eq '/profile/requests'
    expect(Booking.count).to eq(1)
    expect(page).to have_content "Makers"
  end

  scenario 'successfully if already booked property had not been confirmed for the specified dates' do
    sign_up
    add_property
    book_property
    expect { book_property }.to change {Booking.count}
    expect { book_property(from: "20/04/2017")}.to change {Booking.count}
  end

  scenario 'usuccessfully if already booked property had been confirmed for the specified dates' do
    sign_up
    add_property
    book_property
    Booking.first.update(:confirmed => true)
    expect { book_property }.not_to change {Booking.count}
    expect { book_property(from: "20/04/2017")}.not_to change {Booking.count}
  end
end
