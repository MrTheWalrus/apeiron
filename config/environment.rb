# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Apeiron::Application.initialize!

Apeiron::Application.configure do
  config.crisis = false
end