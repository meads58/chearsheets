require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true, message: "User name is taken"
  property :password_digest, Text


  attr_reader :password, :username
  validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(:username => username)
      if user && BCrypt::Password.new(user.password_digest) == password
        user
      else
        nil
      end
  end

end