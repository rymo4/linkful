# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Linkful::Application.initialize!
require "hpricot"
require 'Typhoeus'