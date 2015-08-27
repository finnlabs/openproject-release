$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_project/release/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-release"
  s.version     = OpenProject::Release::VERSION
  s.authors     = "Finn GmbH"
  s.email       = "info@finn.de"
  s.homepage    = "https://www.openproject.org/projects/plugin-release"
  s.summary     = "Provide OpenProject release information"
  s.description = "This plug-in extracts OpenProject release information from two files: RELEASE_DATE and RELEASE_VERSION."
  s.license     = "GPLv3"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "CHANGELOG.md", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.4'

  s.add_development_dependency "sqlite3"
end
