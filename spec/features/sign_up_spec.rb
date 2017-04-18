feature 'User signs up' do

  scenario 'sign up with no error' do
    expect { sign_up }.to change { User.count }.by 1  
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end


  scenario 'user enters invalid email' do
    visit '/users/new'
    fill_in :first_name, with: 'Sally'
    fill_in :last_name, with: 'Wag'
    fill_in :email, with: 'sallysally.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button("Sign up")
    expect(page).to have_content('invalid email format')
    expect(User.count).to eq 0
    expect(current_path).to eq '/users/new'
  end
  scenario 'user doesn\'t enter email' do
    visit '/users/new'
    fill_in :first_name, with: 'Sally'
    fill_in :last_name, with: 'Wag'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button("Sign up")
    expect(page).to have_content('all fields required')
    expect(User.count).to eq 0
    expect(current_path).to eq '/users/new'
  end

  scenario 'mismatched passwords' do
    expect{ sign_up(password:"beard") }.not_to change { User.count }
    expect(current_path).to eq "/users"
    expect(page).to have_content("Password does not match the confirmation")
  end

end
