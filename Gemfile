source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'grape'
# For better json views:
# gem 'rabl'
# gem "grape-rabl"

gem 'devise'
gem 'rails_admin'
gem "airbrake"

group :development do
  gem 'thin'
  gem 'sqlite3'
  gem 'sextant'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Test requirements
group :test do
  gem "colorize"
  gem 'minitest-spec-rails'
  gem 'minitest'
  gem "minitest-metadata"
  gem 'sqlite3'
  gem "factory_girl_rails", "~> 4.0"
  gem 'faker'
  gem 'mocha', :require => false
  gem 'rack-test', :require => "rack/test"
  gem 'database_cleaner'
  gem 'fakeweb'
  gem 'timecop'
  gem 'database_cleaner'
end