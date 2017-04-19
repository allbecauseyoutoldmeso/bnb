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

def log_in(email: "roi@makers.com",
           password: "bosswithabeard")
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button("Log in")
end

def add_property(property_name: "Maker's",
                description: "Fantastic new kitchen",
                price: "200")
    visit '/apartments'
    click_button 'Add a property'
    fill_in :property_name, with: property_name
    fill_in :description, with: description
    fill_in :price, with: price
    click_button 'Submit'
end
