feature 'User log in' do
  scenario 'successfully logs in' do
    sign_up
    log_in
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end

  scenario 'without entering an email' do
    sign_up
    log_in(email:" ")
    expect(current_path).to eq "/sessions/new"
    expect(page).to have_content "Please enter an email"
  end
  # scenario 'with an invalid email'
  # scenario 'with an invalid password'

end
