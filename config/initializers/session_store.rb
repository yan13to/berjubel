# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_berjubel_session',
  :secret      => 'af2cd60cbc75fe83c8db5674133ad14a3066e77d185cbbd40766f0114bea237684b9a289e5f5d48ab6f5a3c542e0ff0c82e907efbe277076311eb07c203b954f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
REST_AUTH_SITE_KEY         = '56cb6f07ae5760d8a583e1b5c3434db47d47601c'
REST_AUTH_DIGEST_STRETCHES = 10
