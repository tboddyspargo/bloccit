source 'https://rubygems.org'
ruby '2.7.2'

# Last used with bundler 1.17.3

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.3'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 5'

gem 'bootstrap-sass'

# Use for encrypting User passwords
gem 'bcrypt', '~> 3'

# Fixes for dependency issues.
gem 'bigdecimal', '~> 1.4.4'
gem 'sprockets', '< 4'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
  
  # Run rpsec tests.
  gem 'rspec-rails', '~> 4.0'
  
  # Use facoties to build data quickly.
  gem 'factory_bot_rails', '~> 5.0'
  
  # for creating fake data.
  gem 'faker', '~> 1.0'
  
  # for easier test syntax
  gem 'shoulda', '~> 4.0'
end

group :production do
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier'
  
  gem 'pg', '~> 0.15'

  gem 'rails_12factor'
 end
 