# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>6'

# Use postgresql as the database for Active Record
gem 'pg'

gem 'sprockets', '~>3.0', require: false

# full text search on postgresql
gem 'textacular', '~> 5.0'

gem 'acts-as-taggable-on'

gem 'carrierwave'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use devise for authentication
gem 'devise'

# use markdown
gem 'redcarpet'

# gem 'kaminari-bootstrap'
gem 'kaminari'

gem 'prometheus-client', '~> 0.6.0'

# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use puma as the app server
# gem 'unicorn'
gem 'puma'

gem 'webpacker', '~> 5.0'

group :development do
  gem 'bcrypt_pbkdf'
  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'ed25519'
  gem 'listen'
  gem 'prettier'
  gem 'rbnacl'
  gem 'rbnacl-libsodium'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rubocop-thread_safety'
end

gem 'dotenv-rails'

group :test do
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end
