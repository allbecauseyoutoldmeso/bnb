class User
  include DataMapper::Resource

  property :id,               Serial
  property :first_name,       String, :required => true
  property :last_name,        String, :required => true
  property :email,            String, :required => true, :unique => true, :format => :email_address
  property :password_digest,   Text

end
