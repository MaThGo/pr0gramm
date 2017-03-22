# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pr0gramm/version'

Gem::Specification.new do |s|
  s.name    = 'pr0gramm'
  s.version = Pr0gramm::VERSION
  s.authors = ['W0rscht', 'mgoerlich']
  s.email   = ['m.goerlich1990@gmail.com']

  s.summary     = 'pr0gramm.com API'
  s.description = 'A Ruby interface to the pr0gramm.com JSON API.'
  s.homepage    = 'https://github.com/MaThGo/pr0gramm'
  s.licenses    = ['GPL-3.0']

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^test/}) # don't include test files
  end
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rest-client', '~> 1.8'

  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "rake", "~> 10.0"
end
