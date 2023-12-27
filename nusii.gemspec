# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nusii/version'

Gem::Specification.new do |spec|
  spec.name          = "nusii"
  spec.version       = Nusii::VERSION
  spec.authors       = ["Víctor Martín"]
  spec.email         = ["support@nusii.com"]

  spec.summary       = %q{Nusii API wrapper.}
  spec.description   = %q{Ruby library for the Nusii API.}
  spec.homepage      = "https://github.com/Nusii/nusii-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bundler", ">= 1.15.0"
  spec.add_runtime_dependency "faraday", '>= 0.9'
  spec.add_runtime_dependency "json", '~> 2.3'
  spec.add_runtime_dependency "activesupport", ">= 6.0.3"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.1.1"
  spec.add_development_dependency "sinatra", "~> 2.0.0"
end
