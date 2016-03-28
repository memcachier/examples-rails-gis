source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 3.2.22.2'
gem 'jquery-rails'
gem 'geocoder'
gem 'newrelic_rpm'

group :assets do
  gem 'uglifier', '>= 2.1.1'
end

# for POW
group :development do
  gem 'sqlite3'
end

# for Heroku, even though we never use the DB.
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# ==========
# MemCachier
# ==========
# We recommend kgio for better performance.
gem 'kgio'
gem 'memcachier'
gem 'dalli'

