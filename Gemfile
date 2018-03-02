source 'https://rubygems.org'
ruby '2.2.3'
gem 'rails', '~> 4.2.7.1'
gem 'rails_12factor'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'paperclip', '~> 5.2.0'
gem 'puma'

group :development, :test do
  # Debuggin' and shit
  gem 'pry-rails'
  # For testing
  gem 'rspec-rails'
end

group :development do
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :prodution do
  gem 'pg'
end

group :test do
  gem 'capybara'
end
