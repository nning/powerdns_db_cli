# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'powerdns_db_cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'powerdns_db_cli'
  spec.version       = PowerDNS::DB::CLI::VERSION
  spec.authors       = ['henning mueller']
  spec.email         = ['mail@nning.io']
  spec.summary       = 'Minimal PowerDNS database administration command-line interface.'
# spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
