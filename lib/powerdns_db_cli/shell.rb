module PowerDNS
  module DB
    class Shell
      def initialize(context)
        ARGV.clear

        require 'irb'

        IRB.setup nil
        IRB.conf[:MAIN_CONTEXT] = IRB::Irb.new.context

        require 'irb/ext/multi-irb'

        IRB.irb nil, context
      end

      def self.start(context)
        new(context)
      end
    end
  end
end
