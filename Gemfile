source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'mongoid_geospatial', git: 'git://github.com/kristianmandrup/mongoid_geospatial.git'

#cache
gem 'redis-rails'
gem 'redis-store'


gem 'gmaps4rails'
gem 'turbolinks'
gem 'twitter'
gem 'haml'
gem 'settingslogic'

gem 'execjs'
gem 'therubyracer'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem "zurb-foundation", "~> 3.2.2"
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :staging, :production do
  gem 'unicorn'
end

group :development do
  gem 'debugger'
  gem "pronghorn"
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'headless'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
end
