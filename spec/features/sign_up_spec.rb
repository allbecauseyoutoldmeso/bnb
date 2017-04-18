feature 'User signs up' do

  scenario 'sign up with no error' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq "/apartments"
    expect(page).to have_content("Hello, Roi")
  end

  scenario 'user enters mismatching password' do
    visit '/users/new'
    fill_in :first_name, with: 'Sally'
    fill_in :last_name, with: 'Wag'
    fill_in :email, with: 'sally@sally.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'differentpassword'
    click_button("Sign up")
    expect(page).to have_content('passwords don\'t match')
    expect(User.count).to eq 0
    expect(current_path).to eq '/users/new'
  end

  scenario 'user enters mismatching password' do
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
  scenario 'user enters mismatching password' do
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


end
