describe User do

describe '.authentic?' do
  it 'checks the user email and password are valid' do
    create_user
    expect(User.authentic?("roi@makers.com", "bosswithabeard")).to eq true
  end
end
end
