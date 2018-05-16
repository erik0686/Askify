source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'best_in_place', '~> 3.0.1'
gem 'bootstrap', '~> 4.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'pg'
gem 'pry'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'simple_form'
gem "paperclip", "~> 6.0.0"
gem 'data-confirm-modal'
gem 'font-awesome-sass', '~> 5.0.9'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
end

group :development do
  gem 'faker'
  gem 'ffaker'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'reek'
  gem 'rubocop'
  gem 'scss_lint', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'rails_12factor', group: :production 

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
