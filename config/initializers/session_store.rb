# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_muncipalerp_session',
  :secret      => 'e5224b408f4047cde52e5266b0f35193feedefb4f469a20c4835f4ad0da190c7d75930509f8bb0a16e50ed8cadc09da06f84e4f88037c47d6dca38372d09dabd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
