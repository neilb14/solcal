# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solcal/version'

Gem::Specification.new do |spec|
  spec.name          = "solcal"
  spec.version       = Solcal::VERSION
  spec.authors       = ["Neil Bourgeois"]
  spec.email         = ["neil.bourgeois@gmail.com"]
  spec.summary       = %q{Solar Calculator: find sunrise, sunset, solar Noon and solar position for any place on earth.}
  spec.description   = %q{Solar Calculator: find sunrise, sunset, solar Noon and solar position for any place on earth.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
