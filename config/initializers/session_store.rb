# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_howihelped_session',
  :secret      => '9260eabadbcc915a5951fb5741525f38f3f8f15a99d318a74ff59257e5357155f2b50948c32caafd2f7f26a3f3ce86845098a81a88bd2df0c590bfccb98bc73b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
