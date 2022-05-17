# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'haml'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop-rails'
  gem 'web-console'
end

group :test do
  gem 'rspec-rails'
end
