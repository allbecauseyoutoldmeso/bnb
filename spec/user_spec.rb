require_relative '../app/models/user'

describe User do

describe '#authentic?' do
  it 'checks the user email and password are valid' do
    User.create(first_name: "Roi",
                last_name: "Driscoll",
                email: "roi@makers.com",
                password: "bosswithabeard",
                password_confirmation: "bosswithabeard")
    expect(User.authentic?("roi@makers.com", "bosswithabeard")).to eq true
  end
end

end
