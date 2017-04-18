feature 'User signs up' do
  scenario 'sign up with no error' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end
  scenario 'mismatched passwords' do
    expect{ sign_up(password:"beard") }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Password does not match the confirmation")
  end
end
