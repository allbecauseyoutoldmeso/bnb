feature 'User log in' do
  scenario 'successfully logs in' do
    sign_up
    click_button 'Log out'
    log_in
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end

  scenario 'without entering an email' do
    sign_up
    click_button 'Log out'
    visit '/sessions/new'
    click_button 'Log in'
    expect(current_path).to eq "/sessions/new"
    expect(page).to have_content "Invalid username or password"
  end

  scenario 'with an invalid email' do
    sign_up
    click_button 'Log out'
    log_in(email:"stranger@gmail.com")
    expect(current_path).to eq "/sessions/new"
    expect(page).to have_content "Invalid username or password"
  end

  scenario 'with an invalid password' do
    sign_up
    click_button 'Log out'
    log_in(password:'idonotlikemybeard')
    expect(current_path).to eq "/sessions/new"
    expect(page).to have_content "Invalid username or password"
  end

  scenario 'cannot log in again once logged in' do
    sign_up
    # log_in
    visit '/sessions/new'
    # click_button 'Log in'
    # expect(current_path).to eq('/apartments')
    expect(page).to have_content "Listings"
  end
end
