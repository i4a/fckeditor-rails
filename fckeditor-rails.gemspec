# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fckeditor/version'

Gem::Specification.new do |spec|
  spec.name          = 'fckeditor-rails'
  spec.version       = Fckeditor::VERSION
  spec.authors       = ['Mohamed Ziata']
  spec.email         = ['wakematta@gmail.com']

  spec.summary       = 'FCKeditor 2.x for Rails 3.1+ (assets pipeline)'
  spec.homepage      = 'https://github.com/i4a/fckeditor-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
