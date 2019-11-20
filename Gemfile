source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'pg'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'colorize'
gem 'dotenv-rails', groups: [:development, :test]
gem 'fabrication'
gem 'faker'
gem 'faraday'
gem 'jwt'
gem 'pry'
gem 'pry-rails'
gem 'rack-cors'
gem 'redis', '~> 4.0'
gem 'simple_command'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rb-readline'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
