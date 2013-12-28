$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'start/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'start'
  s.version     = Start::VERSION
  s.authors     = ['Julio Protzek', 'Renato Carvalho']
  s.email       = ['julio@startae.com.br', 'renato@startae.com.br']
  s.homepage    = 'http://github.com/startae/start'
  s.summary     = 'Collection of Rails generators'
  s.description = 'Start is a collection of Rails generators for faster project setup.'

  s.required_ruby_version = '>= 1.9.3'

  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'railties', '>= 4.0.0', '< 5'

  s.add_development_dependency 'simplecov',   '~> 0.7.1'
  s.add_development_dependency 'rspec-rails', '~> 2.99.0.beta1'
  s.add_development_dependency 'ammeter',     '~> 0.2.9'
end
