powerdns_db_cli
===============

Minimal command-line interface for PowerDNS database administration based on [Active Record](https://github.com/rails/rails/tree/master/activerecord) and [thor](https://github.com/erikhuda/thor). Some of the code was shamelessly copied from [PowerDNS on Rails](https://github.com/kennethkalmer/powerdns-on-rails).

Installation
------------

From source:

    rake install

Or from rubygems.org:

	gem install powerdns_db_cli

Usage
-----

For now, only the [Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html) works which is invoked by `pdns -i`.
