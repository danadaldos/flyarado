source 'https://rubygems.org'

gem 'bcrypt'
gem 'savon', '~> 2.0'

gem 'bootstrap-generators'
gem 'will_paginate-bootstrap'
gem 'forecast_io'
gem 'gmaps4rails'
gem 'will_paginate'
gem 'rspec-collection_matchers'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
  gem 'pry'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'selenium-webdriver', '~>2.35.1'
  gem "chromedriver-helper"
  gem 'foreman'
  gem 'resque', require: 'resque/server'
  gem 'resque-scheduler', '~>2.5.5', require: 'resque_scheduler/server'
  gem 'dotenv-rails', :require => 'dotenv/rails-now'
  gem 'database_cleaner'
  gem 'letter_opener'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'webmock'
end
