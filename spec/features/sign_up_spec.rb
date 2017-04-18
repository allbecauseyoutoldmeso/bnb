feature 'User signs up' do

  scenario 'sign up with no error' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end

  scenario 'without entering a first name' do
    expect{ sign_up(first_name: nil) }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("First name must not be blank")
  end

  scenario 'without entering a last name' do
    expect{ sign_up(last_name: nil) }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Last name must not be blank")
  end

  scenario 'without entering an email' do
    expect{ sign_up(email: nil) }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'with an invalid email' do
    expect{ sign_up(email: "roi") }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'with an existing email' do
    sign_up
    expect{ sign_up }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Email is already taken")
  end

  scenario 'mismatched passwords' do
    expect{ sign_up(password:"beard") }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Password does not match the confirmation")
  end

end
