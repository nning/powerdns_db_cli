module PowerDNS
  module DB
    module CLI
      class Main < Thor
        package_name 'pdns'

        map '-i' => :irb

        desc 'irb', 'Start interactive shell.'
        def irb
          Shell.start(PowerDNS::DB)
        end

        def initialize(*)
          @config = Config.instance
          ActiveRecord::Base.establish_connection(@config)
          super
        end
      end
    end
  end
end
