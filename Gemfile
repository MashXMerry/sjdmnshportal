source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise'
gem "paperclip", "~> 5.0.0"
gem 'paperclip-imgur'
# gem 'imgurapi'
gem 'imgur-api'
gem 'aws-sdk', '~> 2.3'
gem 'client_side_validations'
gem 'materialize-sass'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+
gem 'material_icons'
gem "font-awesome-rails"
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-materialize'
gem 'cancancan', '~> 2.0'
gem 'pg', '~> 0.18.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.2.6"