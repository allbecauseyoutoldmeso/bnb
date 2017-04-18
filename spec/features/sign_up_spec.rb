feature 'User signs up' do
  scenario 'sign up with no error' do
    sign_up
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end
end
