source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'bcrypt', '~> 3.1.13'
gem 'puma', '~> 5.2.2'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.2.1'
gem 'turbolinks', '~> 5.2.1'
gem 'jbuilder', '~> 2.10.0'
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'jquery-rails', '~> 4.4'
gem 'cloudinary', '1.20'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'font-awesome-sass', '~> 5.15', '>= 5.15.1'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'bootstrap-social-rails', '~> 4.12'
gem 'dotenv-rails','2.7.6'

group :development, :test do
  gem 'sqlite3', '~> 1.4.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'byebug', '~> 11.1', '>= 11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '5.0.1'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.3.1'
  gem 'listen', '~> 3.4.1'
  gem 'spring', '~> 2.1', '>= 2.1.1'
end

group :test do
  gem 'capybara', '>= 3.35.3'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  gem 'webdrivers', '~> 4.6'
end

group :production do
  gem 'pg', '1.2.3'
  gem 'aws-sdk-s3', '1.87.0', require: false
  gem 'rails_12factor', '~> 0.0.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
