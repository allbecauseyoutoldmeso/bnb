def sign_up(first_name: "Roi",
            last_name: "Driscoll",
            email: "roi@makers.com",
            password: "bosswithabeard",
            password_confirmation: "bosswithabeard")
  visit '/users/new'
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button("Sign up")
end
