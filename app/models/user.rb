class User < ActiveRecord::Base
  has_many :posts
  has_many :transactions

  validates_presence_of :name, :email, :password, :password_confirmation, :locality
  validates_length_of :login, :within => 3..20
  validates_length_of :password, :within => 5..40
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :email
  validates_confirmation_of :password

def self.authenticate(email, password)
  u = find(:first, :conditions=>["email = ? AND password = ?", email, password])
  return nil if u.nil?
  return u 
end

end
