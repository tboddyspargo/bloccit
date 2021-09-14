source 'https://rubygems.org'
ruby '~> 2.5', '< 3.0'
# Last used with bundler 1.17.3
gem 'rails', '~> 5.0.0'

# Bootstrap style library and dependencies
gem 'bootstrap-sass', '~> 3'
gem 'sass-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Use for encrypting User passwords
gem 'bcrypt'

# In Rails 5.0 the 'respond_to' and 'respond_with' methods for specifying controller behavior were moved to the responders gem.
gem 'responders'

# Fixes for dependency issues.
# gem 'bigdecimal', '~> 1.4.4'
# gem 'sprockets', '< 4'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
  
  # Run rpsec tests.
  gem 'rspec-rails'

  # In Rails 5.0 'assigns' and 'assert_template' have been moved to a different gem.
  gem 'rails-controller-testing'
  
  # Use facoties to build data quickly.
  gem 'factory_bot_rails'
  
  # for creating fake data.
  gem 'faker'
  
  # for easier test syntax
  gem 'shoulda'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :production do
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier'
  
  # heroku requires using postgresql for production deploys.
  gem 'pg'

  # heroku requires rails_12factor for ENV variables in production deploys.
  gem 'rails_12factor'
 end
 