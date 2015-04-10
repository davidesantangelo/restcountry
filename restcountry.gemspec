# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restcountry/version'

Gem::Specification.new do |spec|
  spec.name          = "restcountry"
  spec.version       = Restcountry::VERSION
  spec.authors       = ["Davide Santangelo"]
  spec.email         = ["davide.santangelo@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{Gem to wrap BensBenzes.com API}
  spec.description   = %q{Basic API implementation for REST Countries API http://restcountries.eu}
  spec.homepage      = "https://github.com/davidesantangelo/restcountry"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
