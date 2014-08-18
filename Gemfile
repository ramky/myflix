source 'https://rubygems.org'
ruby '2.1.1'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'rails'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'bcrypt-ruby', "~> 3.1.5"
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms'
gem 'fabrication'
gem 'faker'
gem 'carrierwave'
gem 'mini_magick'
gem 'stripe'

group :development do
  gem 'sqlite3'
  gem 'pry-nav'
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'letter_opener'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'hirb'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'launchy'
  gem 'capybara-email', github: 'dockyard/capybara-email'
  gem 'vcr'
  gem 'webmock'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

