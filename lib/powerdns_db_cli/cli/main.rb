module PowerDNS
  module DB
    module CLI
      class Main < Thor
        package_name 'pdns'

        map '-i' => :irb
        map '-v' => :version

        desc 'irb', 'Start interactive shell.'
        def irb
          Shell.start(PowerDNS::DB)
        end

        desc 'version', 'Show version'
        def version
          puts PowerDNS::DB::CLI::VERSION
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
