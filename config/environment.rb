# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bridescity::Application.initialize!

Sass::Plugin.options[:template_location] = "app/sass"