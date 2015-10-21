# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'figaro/backup/version'

Gem::Specification.new do |spec|
  spec.name          = "figaro-backup"
  spec.version       = Figaro::Backup::VERSION
  spec.authors       = ["Joel Van Horn"]
  spec.email         = ["joel@joelvanhorn.com"]
  spec.summary       = %q{Make sure configuration files are symlinked to Dropbox.}
  spec.description   = %q{Make sure configuration files are symlinked to Dropbox.}
  spec.homepage      = "https://github.com/joelvh/figaro-backup"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "figaro", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rails", "~> 3.2"
  spec.add_development_dependency "rake"
end
