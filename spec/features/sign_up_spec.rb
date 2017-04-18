feature 'User signs up' do
  scenario 'sign up with no error' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end
end
