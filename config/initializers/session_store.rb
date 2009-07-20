# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_karma_session',
  :secret      => '71eaf518fe9b6c983c8d476b7ecb844c272487314509f337a238626aa8fc4b7a73d88b5daa120a34d046dd1b7b7fa7938a83b0978dd783ba630b9d8f688e0cb1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
