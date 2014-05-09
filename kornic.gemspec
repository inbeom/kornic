# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kornic/version'

Gem::Specification.new do |spec|
  spec.name          = 'kornic'
  spec.version       = Kornic::VERSION
  spec.authors       = ['Inbeom Hwang']
  spec.email         = ['hwanginbeom@gmail.com']
  spec.summary       = %q{Like Chronic speaks Korean}
  spec.description   = %q{Converts Korean natural language to dates.}
  spec.homepage      = 'http://github.com/inbeom/kornic'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end
