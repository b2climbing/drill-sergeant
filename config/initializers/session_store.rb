# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_drill-sergeant_session',
  :secret      => 'af909951b3213c39d9e7d78a1bb2c8f8b6336f1bb04ea05df862880f8f17063a8fd2deb4765b88ed7f106ee244e350e8724012e964858f9fd8f34bdf0498e300'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
