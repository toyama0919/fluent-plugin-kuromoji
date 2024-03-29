# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-kuromoji"
  gem.version     = "0.0.1"
  gem.authors     = ["Hiroshi Toyama"]
  gem.email       = "toyama0919@gmail.com"
  gem.homepage    = "https://github.com/toyama0919/fluent-plugin-kuromoji"
  gem.description = "Output kuromoji analysis Plugin for fluentd"
  gem.summary     = "Output kuromoji analysis Plugin for fluentd"
  gem.licenses    = ["MIT"]
  gem.has_rdoc    = false

  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency "fluentd"
  gem.add_runtime_dependency "kuromoji-ruby"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "spork"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "fluent-plugin-twitter"

end
