# -*- encoding: utf-8 -*-
require File.expand_path('../lib/baby_kisser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jake Schmitz"]
  gem.email         = ["jschmitz@gmail.com"]
  gem.description   = %q{Convert the xml for politicians at govtrack to an array of hashes}
  gem.summary       = %q{Make politicians data more accessible via an array of hashes}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "baby_kisser"
  gem.require_paths = ["lib"]
  gem.version       = BabyKisser::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'nokogiri'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'gem-release'
end
