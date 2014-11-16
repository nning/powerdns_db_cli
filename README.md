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

    pdns domain list
    pdns domain create <name>
    pdns domain remove <name>

	pdns record list <domain> [type]
	pdns record create <domain> <name> <type> <content> [prio] [ttl] [auth]
	pdns record remove <domain> <name> <type> [content] [prio]

With `pdns -i`, it is also possible to interact with the database direcly using the [Active Record Query Interface](http://guides.rubyonrails.org/active_record_querying.html).
