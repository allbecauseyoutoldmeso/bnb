feature 'User log in' do
  scenario 'successfully logs in' do
    sign_up
    visit 'sessions/log_in'
    fill_in :email, with: "roi@makers.com"
    fill_in :password, with: "bosswithabeard"
    click_button("Log in")
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end
end
