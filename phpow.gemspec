# -*- encoding: utf-8 -*-
require File.expand_path('../lib/phpow/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Daniel Ott"]
  gem.email         = ["danott@me.com"]
  gem.description   = %q{Develop your legacy PHP applications utilizing POW's TLDs on Mac OS X}
  gem.summary       = %q{Having a single TLD for both Rails and PHP development keeps things simple. But both POW and Apache can't listen on port 80. Get around this by running a light weight Rack application in POW as an in-between for Apache/PHP running on a different port.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "phpow"
  gem.require_paths = ["lib"]
  gem.version       = Phpow::VERSION
end
