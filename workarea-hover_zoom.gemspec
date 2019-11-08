$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'workarea/hover_zoom/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'workarea-hover_zoom'
  s.version     = Workarea::HoverZoom::VERSION
  s.authors     = ['Curt Howard', 'Ges Jeremie']
  s.email       = ['choward@workarea.com', 'jges@weblinc.com']
  s.summary     = 'A Hover Zoom plugin for Product Detail Pages.'
  s.description = 'This plugin adds zoom capabilities (desktop/mobile) on primary images.'
  s.files = `git ls-files`.split("\n")
  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'workarea-jquery_zoom'
  s.add_dependency 'workarea-jquery_magnify'

  s.add_dependency 'workarea', '~> 3.x'
end
