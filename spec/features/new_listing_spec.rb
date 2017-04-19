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
    add_property
    visit '/apartments'
    add_property(property_name: "Mansion House",
                    description: "In the heart of the countryside",
                    price: "500")
  end
end
