$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'start/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'start'
  s.version     = Start::VERSION
  s.authors     = ['Julio Protzek', 'Renato Carvalho']
  s.email       = ['julio@startae.com.br', 'renato@startae.com.br']
  s.homepage    = 'http://github.com/startae/kickoff_rails'
  s.summary     = 'Collection of Rails generators'
  s.description = 'Start is a collection of Rails generators for faster project setup.'

  s.license = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'railties', '>= 3.2.6', '< 5'
end
