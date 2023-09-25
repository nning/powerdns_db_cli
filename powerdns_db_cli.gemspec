require './lib/powerdns_db_cli/version'

Gem::Specification.new do |s|
  s.name          = 'powerdns_db_cli'
  s.version       = PowerDNS::DB::CLI::VERSION
  s.authors       = ['henning mueller']
  s.email         = ['mail@nning.io']

  s.summary       = 'Minimal command-line interface for PowerDNS database administration.'
# s.description   = %q{TODO: Write a longer description. Optional.}
  s.homepage      = ''
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'pg', '~> 1.5', '>= 1.5.4'
  s.add_development_dependency 'rake', '~> 13.0.6'

  s.add_runtime_dependency 'activerecord', '~> 7.0', '>= 7.0.7.2'
  s.add_runtime_dependency 'thor', '~> 1.2', '>= 1.2.2'
  s.add_runtime_dependency 'terminal-table', '~> 3.0', '>= 3.0.2'

  s.required_ruby_version = "~> 3.2"
end
