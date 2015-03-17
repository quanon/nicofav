source 'https://rubygems.org'
ruby '2.2.1'

# Framework
gem 'rails', '~> 4.2.0'
gem 'responders'

# Database
gem 'pg'
gem 'database_cleaner', '~> 1.4.1'

# Assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'slim-rails'
gem 'therubyracer'
gem 'nprogress-rails'
gem 'momentjs-rails', github: 'derekprior/momentjs-rails'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'skim'

# Assets (Rails Assets)
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-jquery-ui'
  gem 'rails-assets-backbone'
  gem 'rails-assets-backbone.marionette'
  gem 'rails-assets-backbone.stickit'
  gem 'rails-assets-backbone-relational'
  gem 'rails-assets-cocktail'
  gem 'rails-assets-bootswatch-scss'
  gem 'rails-assets-bootbox'
  gem 'rails-assets-jquery-autosize'
end

# Decorators
gem 'draper'

# Models
gem 'enumerize'
gem 'validates_email_format_of'
gem 'amoeba'
gem 'ransack'
gem 'factory_girl'
gem 'factory_girl_rails'

# Views
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'compass-rails'
gem 'font-awesome-rails'
gem 'simple_form'
gem 'cocoon'
gem 'kaminari'
gem 'enum_help'
gem 'i18n-js'
gem 'jquery-datatables-rails'
gem 'ajax-datatables-rails'
gem 'gon'

# Configurations
gem 'settingslogic'

# XML
gem 'nokogiri-happymapper', require: 'happymapper'

# Utilities
gem 'hashie'
gem 'ruby-progressbar'

# Debugs
gem 'awesome_print'
gem 'pry-byebug'
gem 'pry-doc'
gem 'pry-rails'
gem 'pry-stack_explorer'

# Environment Variables
gem 'dotenv-rails'
gem 'nenv'

group :doc do
  gem 'sdoc'
end

group :development do
  # Debugs
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'quiet_assets'
  gem 'tapp'
  gem 'view_source_map'
  gem 'i18n-tasks'
  gem 'thin'
end

group :test, :development do
  # TDD
  gem 'brakeman'
  gem 'guard-rspec', require: false
  gem 'json_expressions'
  gem 'rails-db-resetup'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec-parameterized'
  gem 'minitest'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'json_spec'
  gem 'rubocop', require: false
  gem 'rails_best_practices'
  gem 'guard-rubocop'
  gem 'rack-mini-profiler'
end
