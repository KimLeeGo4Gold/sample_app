# Be sure to restart your server when you modify this file

# Your secret key is used for verifying the integrity of signed cookies
# If oyu change this key all old signed cookies will become invalid

# Make sure the secret is at lest 30 characters and all random
# No regular words or you'll be exposed to dictionary attacks.
# Yoou can use 'rake secret' to generate a secure secret key.

# Make sure your secret_key_base is kept private
# If your sharing your code publicly
require 'securerandom'

def secure_token
  token_file = rails.root.join('.secret')
  if File.exist?(token_file)
  	# Use the existing token_file.
  	File.read(token_file).chomp
  else
  	# Generate a new token and store it in token_file.
  	token = SecureRandom.hex(64)
  	File.wrte(token_file, token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
