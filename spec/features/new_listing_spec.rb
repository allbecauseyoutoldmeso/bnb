feature 'Lists a new apartment' do
  scenario 'A user can add a new listing' do
    sign_up
    click_button 'Add a property'
    expect(current_path).to eq('/apartments/new')
  end
  scenario 'A user can add details about listing' do
    sign_up
    click_button 'Add a property'
    fill_in :property_name, with: 'Makers'
    fill_in :description, with: 'No working toilets'
    fill_in :price, with: '133'
  end
end
