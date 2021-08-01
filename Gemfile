source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

## Core
gem 'rails', '~> 5.2.5'
gem 'bootsnap', '>= 1.1.0', require: false

## Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

## Frontend
gem 'coffee-rails', '~> 4.2'
gem 'kaminari'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

## Backend
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'enum_help'
gem 'jbuilder', '~> 2.5'
gem 'mini_magick', '~> 4.8'
# gem 'capistrano-rails', group: :development
# gem 'mini_racer', platforms: :ruby
# gem 'redis', '~> 4.0'
# gem 'sidekiq'

## Authentication
gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem "recaptcha", require: "recaptcha/rails"
# gem 'devise_invitable'

## Payment
gem 'payjp'

## Map
gem 'gon'
gem 'geocoder'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'gimei'
  gem 'guard-rspec', require: false
  gem 'launchy'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  # gem 'rubocop-checkstyle_formatter'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'letter_opener_web'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-parameterized'
  gem 'timecop'
  gem 'webdrivers'
  # gem 'rspec-retry'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]