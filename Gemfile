source 'https://rubygems.org'
 
# Last used with bundler 1.17.3

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.3'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.4.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'bootstrap-sass'

# Use for encrypting User passwords
gem 'bcrypt'

gem 'figaro', '~> 1.2'

gem 'bigdecimal', '1.3.5'

gem 'sprockets', '< 4'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
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
  gem 'pg'
  gem 'rails_12factor'
 end
 