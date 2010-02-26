# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rest_demo_session',
  :secret      => '44fab97e55393f3abac49b6eeade0b3ee88b056ad3a1866bdbce175a02e299dca52bb60471a495f776a749067fc33fe4fd78dd61a1e059dca9c6e340cc7f76da'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
