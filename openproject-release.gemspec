$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_project/release/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-release"
  s.version     = OpenProject::Release::VERSION
  s.authors     = ["Finn GmbH"]
  s.email       = ["info@openproject.org"]
  s.homepage    = "http://www.openproject.org"
  s.summary     = "Provide OpenProject release information"
  s.description = "This plug-in extracts OpenProject release information from two files: RELEASE_DATE and RELEASE_VERSION."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"

  s.add_development_dependency "sqlite3"
end
