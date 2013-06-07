source 'http://rubygems.org'

gem 'rails', '~> 3.2.13'
gem 'jquery-rails'
gem 'geocoder'

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
end

# ==========
# MemCachier
# ==========
# We recommend kgio for better performance.
gem 'kgio'
gem 'memcachier'
gem 'dalli'

