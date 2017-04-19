feature 'User log out' do
  scenario 'successfully logs out' do
    sign_up
    log_in
    click_button 'Log out'
    expect(page).not_to have_content("Hello, Roi")
  end
end
