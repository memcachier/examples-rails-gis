MemCachier GIS Example
=====

This is an example Rails app that uses MemCachier to cache GIS lookups in Heroku.  This example is written with Rails 3.1.

You can view a working version of this app at (http://memcachier-gis.herokuapp.com).  Running this app on your location machine in
development will work as well, although then you won't be using MemCachier -- you'll be using a local cache.  MemCachier is currently
only available in Heroku.

Setting up MemCachier to work in Rails is very easy.  You need to make changes to Gemfile, production.rb, and any app code that
you want cached.  These changes are covered in detail below:

Gemfile
-----

MemCachier has been tested with the dalli memcache client.  Add the following Gem to your Gemfile:

    gem 'memcachier'
    gem 'dalli'

Don't forget to run `bundle install`

production.rb
-----

Ensure that the following configuration option is set in production.rb:

    config.cache_store = :dalli_store

Application Code
-----

In your application, use Rails.cache methods to access MemCachier.  A list of methods is available [here](http://api.rubyonrails.org/classes/ActiveSupport/Cache/Store.html).

Take a look at [app/controllers/home_controller.rb](http://github.com/memcachier/memcachier-gis-example/blob/master/app/controllers/home_controller.rb) in this repository for an example.
