# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Babynotes::Application.initialize!

# Default format for displaying dates and times
# Date::DATE_FORMATS[:default] = "%m/%d/%Y"
# Time::DATE_FORMATS[:default] = "%m/%d/%Y"

Time::DATE_FORMATS[:milestone] = lambda { |time| time.strftime("%d %B  %Y").upcase + " | " + time.strftime("%I:%M%p").downcase }