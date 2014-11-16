require 'singleton'
require 'yaml'

module PowerDNS
  module DB
    class Config < Hash
      include Singleton

      PATH = File.expand_path('~/.config/PowerDNS/db_cli.yaml')

      DEFAULT = {
        adapter: 'postgresql',
        host: 'localhost',
        port: 5432,
        database: 'pdns',
        username: 'postgres',
        password: '',
        default_soa: 'ns.example.com. dns.example.com. 1970010100 60 3600 604800 40000'
      }

      def initialize
        self.merge!(DEFAULT)
        self.merge!(YAML.load_file(PATH)) if File.exists?(PATH)
      end
    end
  end
end
