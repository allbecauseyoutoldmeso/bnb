feature 'User log in' do
  scenario 'successfully logs in' do
    sign_up
    log_in
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end
end
