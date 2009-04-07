# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-metal-profiler_session',
  :secret      => '6dc0b651fa960071d13e0a8927fa1451035f8f595afa26f96ac55e77ea7da36c04261aefa9d4bb5eb7003aaf7ac0a95712f6d147f1ea6ceef5527df53b4fa221'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
