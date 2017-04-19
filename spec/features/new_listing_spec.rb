feature 'Lists a new apartment' do
  scenario 'A user can add a new listing' do
    sign_up
    click_button 'Add a property'
    expect(current_path).to eq('/apartments/new')
  end
  scenario 'A user can add details about listing' do
    sign_up
    add_property
  end
  scenario 'A user can add mutiple listings' do
    sign_up
    add_property(property_name: "Scary House",
                    description: "Boo!",
                    price: "800")
    expect{ add_property }.to change { Listing.count }.by 1
    add_property
    expect{ add_property }.to change { Listing.count }.by 1
  end
  scenario 'A user cannot list an existing apartment' do
    sign_up
    add_property
    visit '/apartments'
    add_property
  expect{ add_property }.to change { Listing.count }.by 1
  end
end
