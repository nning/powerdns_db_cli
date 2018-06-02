module PowerDNS
  module DB
    module CLI
    end
  end
end

require 'active_record'
require 'terminal-table'
require 'thor'

require 'powerdns_db_cli/version'

require 'powerdns_db_cli/cryptokey'
require 'powerdns_db_cli/domainmetadatum'
require 'powerdns_db_cli/domain'
require 'powerdns_db_cli/record'
require 'powerdns_db_cli/supermaster'
require 'powerdns_db_cli/tsigkey'

require 'powerdns_db_cli/config'
require 'powerdns_db_cli/shell'

require 'powerdns_db_cli/cli/main'
require 'powerdns_db_cli/cli/domain'
require 'powerdns_db_cli/cli/record'
