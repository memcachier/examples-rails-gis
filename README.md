MemCachier GIS Example
=====

This is an example Rails app that uses MemCachier to cache GIS lookups in Heroku.  This example is written with Rails 3.1.

You can view a working version of this app at [memcachier-gis.herokuapp.com](http://memcachier-gis.herokuapp.com).  Running this app on your local machine in
development will work as well, although then you won't be using MemCachier -- you'll be using a local cache.  MemCachier is currently
only available in Heroku.

Setting up MemCachier to work in Rails is very easy.  You need to make changes to Gemfile, production.rb, and any app code that
you want cached.  These changes are covered in detail below:

Gemfile
-----

MemCachier has been tested with the dalli memcache client.  Add the following Gem to your Gemfile:

    gem 'memcachier'
    gem 'dalli'

Note that the memcachier gem just set the appropriate environment variables for Dalli. You can also do this manually in your production.rb file:

    ENV["MEMCACHE_SERVERS"] = ENV["MEMCACHIER_SERVERS"]
    ENV["MEMCACHE_USERNAME"] = ENV["MEMCACHIER_USERNAME"]
    ENV["MEMCACHE_PASSWORD"] = ENV["MEMCACHIER_PASSWORD"]

Alternatively, you can pass these options to config.cache_store (also in production.rb):

    config.cache_store = :dalli_store, ENV["MEMCACHIER_SERVERS"],
                        {:username => ENV["MEMCACHIER_USERNAME"],
                         :password => ENV["MEMCACHIER_PASSWORD"]}

Don't forget to run `bundle install`

production.rb
-----

Ensure that the following configuration option is set in production.rb:

    config.cache_store = :dalli_store

Application Code
-----

In your application, use Rails.cache methods to access MemCachier.  A list of methods is available [here](http://api.rubyonrails.org/classes/ActiveSupport/Cache/Store.html).  All the built-in Rails caching tools will work, too.

Take a look at [app/controllers/home_controller.rb](http://github.com/memcachier/memcachier-gis-example/blob/master/app/controllers/home_controller.rb) in this repository for an example.
