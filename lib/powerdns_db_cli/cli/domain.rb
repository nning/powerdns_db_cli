module PowerDNS
  module DB
    module CLI
      class Domain < Thor
        desc 'create <name>', 'Create domain.'
        def create(name)
          DB::Domain.create!(name: name, type: 'MASTER')
        end

        desc 'list', 'List domains.'
        def list
          headings = [:name, :type]
          rows = DB::Domain.order(*headings).pluck(*headings)
          puts Terminal::Table.new(headings: headings, rows: rows)
        end

        desc 'remove <name>', 'Remove domain.'
        def remove(name)
          DB::Domain.where(name: name, type: 'MASTER').first!.destroy!
        end
      end

      class Main
        desc 'domain <action> [args..]', 'Domain actions.'
        subcommand 'domain', Domain
      end
    end
  end
end
