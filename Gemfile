source 'https://rubygems.org'
ruby '~> 2.5', '< 3.0'
# Last used with bundler 1.17.3
gem 'rails', '~> 6.0.0'

# Bootsnap drastically improves application start times.
gem 'bootsnap'

# Rails 6 uses webpacker as the default javascript compiler.
gem 'webpacker', '6.0.0.rc.5'

# Use bootstrap 3 through gem since Webpacker 6 will discourage managing styles.
gem 'bootstrap-sass'
gem 'sassc-rails'

# Using sprockets for SCSS will require the sass-rails gem.
gem 'sass-rails'

# Use for encrypting User passwords
gem 'bcrypt'

# In Rails 5.0 the 'respond_to' and 'respond_with' methods for specifying controller behavior were moved to the responders gem.
gem 'responders'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  
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

  # The dev environment can automatically reload when it sees files change.
  gem 'spring'

  # Spring and db gems need listen.
  gem 'listen'
end

group :production do
  # heroku requires using postgresql for production deploys.
  gem 'pg'

  # heroku requires rails_12factor for ENV variables in production deploys.
  gem 'rails_12factor'
 end
 