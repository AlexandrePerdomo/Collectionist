# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

gem 'cocoon'
gem 'simple_form'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Call 'binding.pry' in the code to use pry debugger
  gem 'bullet'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'annotate'
  gem 'brakeman', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'better_html'
  gem 'capybara'
  gem 'erb_lint'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'timecop'
  gem 'webdrivers'

  # Shoulda helps you write more understandable, maintainable Rails-specific tests using Minitest.
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  # add support for BigDecimal
  gem 'bigdecimal', '1.3.5'

  gem 'simplecov', require: false
end
