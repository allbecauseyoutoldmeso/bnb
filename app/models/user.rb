require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,               Serial
  property :first_name,       String, :required => true
  property :last_name,        String, :required => true
  property :email,            String, :required => true, :unique => true, :format => :email_address
  property :password_digest,   Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authentic?(username, password)
    user = first(username: username)
    user && BCrypt::Password.new(user.password_digest) == password
  end
end
