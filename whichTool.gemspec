# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whichTool/version"

Gem::Specification.new do |spec|
  spec.name          = "whichTool"
  spec.version       = WhichTool::VERSION
  spec.authors       = ["Paul Johnson"]
  spec.email         = ["Paul.sjohnson91@gmail.com"]

  spec.summary       = "Short test of Which? website"
  spec.description   = "Test of Which? website for interview process."
  spec.homepage      = "http://www.github.com/paulsjohnson91"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'selenium-webdriver'
  spec.add_dependency 'cucumber'
  spec.add_dependency 'chromedriver-helper'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
