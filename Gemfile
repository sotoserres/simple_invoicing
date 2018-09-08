source 'https://rubygems.org'

# ruby '2.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5', '>= 5.2.1'
gem 'pg'#, '~> 0.21'
gem 'sqlite3'
gem 'mysql2'

# Use haml as templating language
gem 'haml-rails'
gem 'font-awesome-sass', '~> 5.3.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use bootstrap as the front-end framework
gem 'bootstrap-sass', '~> 3.3.7'
gem 'formtastic-bootstrap'
gem 'formtastic'

gem 'bootstrap-datepicker-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'momentjs-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-datatables-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'puma'
gem 'activerecord-native_db_types_override'
gem 'dotenv-rails'

# to show flash messages from ajax requests
gem 'unobtrusive_flash', '>=3'

# to have user authentication
gem 'devise'
gem 'devise-i18n'

# to support openID authentication
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-openid'
gem 'omniauth-google-oauth2'

# to have user authorization
gem 'cancancan'
gem 'rolify'

# to validate url and email
gem 'validate_url'
gem 'validates_email_format_of'

group :production do
  # To receive emails on errors
  gem 'exception_notification'
  gem 'rails_12factor'
end

group :development do
  # To open emails in browser
  gem 'letter_opener'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'tzinfo-data'
  gem 'capybara'
end
