Gem::Specification.new do |s|
  s.name          = 'powerdns_db_cli'
  s.version       = '0.0.1'
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

  s.add_development_dependency 'bundler', '~> 1.7'
  s.add_development_dependency 'rake', '~> 10.0'

  s.add_runtime_dependency 'activerecord', '~> 4.1'
  s.add_runtime_dependency 'thor', '~> 0.19'
  s.add_runtime_dependency 'terminal-table', '~> 1.4.5'
end
