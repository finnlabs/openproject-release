require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'finn_release/finn_release'
end

Redmine::Plugin.register :finn_release do
  name 'Finn release plugin'
  author 'Stephan Eckardt @ finnlabs'
  author_url 'http://www.finn.de'
  description 'This plugin makes the Finn release version information available to Chiliproject'
  version '0.1'
end
