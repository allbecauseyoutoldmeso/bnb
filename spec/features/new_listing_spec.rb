feature 'Lists a new apartment' do
  scenario 'A user can add a new listing' do
    sign_up
    click_button 'Add a property'
    expect(current_path).to eq('/apartments/new')
  end

  scenario 'A user can add mutiple listings' do
    sign_up
    add_property(property_name: "Scary House",
                    description: "Boo!",
                    price: "800")
    expect{ add_property }.to change { Listing.count }.by 1
    expect(Listing.count).to eq(2)
  end

  scenario 'A user cannot list an existing apartment' do
    sign_up
    add_property
    expect{ add_property }.not_to change { Listing.count }
  end

  scenario 'A user is able to view all listings' do
    sign_up
    add_property
    expect(page).to have_content "Maker's"
end
end
