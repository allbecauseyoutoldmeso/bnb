feature 'Lists a new apartment' do
  scenario 'A user can add a new listing' do
    sign_up
    click_button 'Add a property'
    expect(current_path).to eq('/apartments/new')
  end
end
