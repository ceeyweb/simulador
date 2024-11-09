# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem 'bcrypt', '~> 3.1.7'
gem "rails", "~> 5.2.3"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "bootsnap", ">= 1.1.0", require: false
gem "simple_form"
gem "social-share-button"

group :development, :test do
  gem "pry-rails"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop-rails"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "rspec_junit_formatter"
  gem "simplecov", require: false
  gem "rails-controller-testing"
end
