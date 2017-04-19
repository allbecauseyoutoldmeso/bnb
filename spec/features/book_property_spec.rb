feature 'User books a property' do
  scenario 'select a property' do
    Listing.create(name: "Makers", description: "No toilets working", price: "133")
    sign_up
    click_link "Makers"
    expect(current_path).to eq('booking/new')
    expect(page).to have_content("Makers")
    expect(page).to have_content("Pick a night")
  end
end
