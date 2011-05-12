require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'finn_release/finn_release'
end

Redmine::Plugin.register :chiliproject_finn_release do
  name 'Chiliproject Finn release plugin'
  author 'Stephan Eckardt @ finnlabs'
  author_url 'http://www.finn.de'
  description 'This plugin makes the Finn release version information available to Chiliproject'
  version '0.1'
end
