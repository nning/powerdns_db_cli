module PowerDNS
  module DB
    module CLI
      class Record < Thor
        include Thor::Actions

        desc 'create <domain> <name> <type> <content> [prio] [ttl] [auth]', 'Create record.'
        def create(domain, name, type, content, prio = 0, ttl = 38400, auth = 'true')
          d = DB::Domain.where(name: domain).first!

          d.records.create! \
            name: name,
            type: type,
            content: content,
            prio: prio,
            ttl: ttl,
            auth: auth == 'true'
        end

        desc 'list <domain> [type]', 'List records of domain.'
        def list(domain, type = nil)
          d = DB::Domain.where(name: domain).first!
          
          h = [:name, :type, :prio, :content, :ttl, :auth]

          r = type.nil? ? d.records : d.records.where(type: type)
          r = r.order(*h[0..1]).pluck(*h)

          t = Terminal::Table.new(headings: h, rows: r)
          t.align_column(0, :right)

          puts t
        end

        desc 'remove <domain> <name> <type> [content] [prio]', 'Remove record.'
        def remove(domain, name, type, content = nil, prio = nil)
          d = DB::Domain.where(name: domain).first!

          h = { name: name, type: type }
          h[:content] = content unless content.nil?
          h[:prio] = prio unless prio.nil?

          r = d.records.where(h)
          c = r.size

          if c > 0
            r.destroy_all if yes?("Delete #{c} records?")
          else
            say("No records found.")
          end
        end
      end

      class Main
        desc 'record <action> [args..]', 'Record actions.'
        subcommand 'record', Record
      end
    end
  end
end
