require 'singleton'
require 'yaml'

module PowerDNS
  module DB
    class Config < Hash
      include Singleton

      PATH = '~/.config/PowerDNS/db_cli.yaml'

      DEFAULT = {
        adapter: 'postgresql',
        host: 'localhost',
        port: 5432,
        database: 'pdns',
        username: 'postgres',
        password: ''
      }

      def initialize
        if File.exists?(File.expand_path(PATH))
          self.merge!(YAML.load_file(PATH))
        else
          self.merge!(DEFAULT)
        end
      end
    end
  end
end
