source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem 'active_model_serializers', '~> 0.10.0'
gem "rails", "~> 7.0.8"
gem "importmap-rails"
gem 'turbo-rails'
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "config"
gem 'rails_admin', '~> 3.1.2'
gem 'rails_admin-i18n'
gem 'devise'
gem 'rails-i18n'
gem 'pg'
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem 'carrierwave', '~> 3.0'
gem "hashid-rails", "~> 1.0"
gem 'metainspector'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

gem "sassc-rails"

gem "tailwindcss-rails", "~> 3.0"
