module PowerDNS
  module DB
    class CLI < Thor
      VERSION = '0.0.1'

      package_name 'pdns'

      map '-i' => :irb

      desc 'irb', 'Start interactive shell.'
      def irb
        PowerDNS::DB::Shell.start(PowerDNS::DB)
      end

      def initialize(*)
        @config = Config.instance
        ActiveRecord::Base.establish_connection(@config)
        super
      end
    end
  end
end
