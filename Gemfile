source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'jbuilder', '~> 2.0'
gem "mysql2"
gem "unicorn"

group :doc do
  gem "sdoc", "~> 0.4.0", group: :doc
end

group :test do
  gem "rspec"
  gem "webmock"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "ffaker"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
end

group :development do
  gem "better_errors"
  gem "rspec-rails"
  gem "rails-erd"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "awesome_print"
end

group :test, :development do
  gem "pry"
  gem "pry-rails"
  gem "spring"
  gem "guard-rspec"
end
