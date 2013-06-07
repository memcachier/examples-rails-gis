# MemCachier Rails Example

This is an example Rails app that uses
[MemCachier](http://www.memcachier.com) to GIS lookups. This example
is written with Rails 3.1.

You can view a working version of this app
[here](http://memcachier-examples-rails.herokuapp.com).
Running this app on your local machine in development will work as
well, although then you won't be using MemCachier -- you'll be using a
local dummy cache. MemCachier is currently only available with various
cloud providers.

## Setup MemCachier

Setting up MemCachier to work in Rails is very easy. You need to make
changes to Gemfile, production.rb, and any app code that you want
cached. These changes are covered in detail below.

### Gemfile

MemCachier has been tested with the [dalli memcache
client](https://github.com/mperham/dalli). Add the following Gem to
your Gemfile:

~~~~ .ruby
gem 'memcachier'
gem 'dalli'
~~~~

Then run `bundle install` as usual.

Note that the `memcachier` gem simply sets the appropriate environment
variables for Dalli. You can also do this manually in your
production.rb file if you prefer:

~~~~ .ruby
ENV["MEMCACHE_SERVERS"] = ENV["MEMCACHIER_SERVERS"]
ENV["MEMCACHE_USERNAME"] = ENV["MEMCACHIER_USERNAME"]
ENV["MEMCACHE_PASSWORD"] = ENV["MEMCACHIER_PASSWORD"]
~~~~

Alternatively, you can pass these options to config.cache_store (also
in production.rb):

~~~~ .ruby
config.cache_store = :dalli_store, ENV["MEMCACHIER_SERVERS"],
                    {:username => ENV["MEMCACHIER_USERNAME"],
                     :password => ENV["MEMCACHIER_PASSWORD"]}
~~~~

### production.rb

Ensure that the following configuration option is set in production.rb:

~~~~ .ruby
config.cache_store = :dalli_store
~~~~

## Using MemCachier

In your application, use `Rails.cache` methods to access MemCachier.
A list of methods is available
[here](http://api.rubyonrails.org/classes/ActiveSupport/Cache/Store.html).
All the built-in Rails caching tools will work, too.

Take a look at
[app/controllers/home_controller.rb](https://github.com/memcachier/examples-rails/blob/master/app/controllers/home_controller.rb)
in this repository for an example.

## Get involved!

We are happy to receive bug reports, fixes, documentation enhancements,
and other improvements.

Please report bugs via the
[github issue tracker](http://github.com/memcachier/examples-rails/issues).

Master [git repository](http://github.com/memcachier/examples-rails):

* `git clone git://github.com/memcachier/examples-rails.git`

## Licensing

This library is BSD-licensed.

