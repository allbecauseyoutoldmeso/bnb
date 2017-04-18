feature 'User signs up' do
  scenario 'sign up with no error' do
    visit('/users/new')
    fill_in :first_name, with: "Roi"
    fill_in :last_name, with: "Driscoll"
    fill_in :email, with: "roi@makers.com"
    fill_in :password, with: "ilikemybeard"
    fill_in :password_confirmation, with: "ilikemybeard"
    click_button("Submit")
    expect(current_path).to equal("/apartments")
    expect(page).to have_content("Hello, Roi")
  end
end
