require 'rails/engine'

module Release
  class Engine < ::Rails::Engine
    isolate_namespace OpenprojectRelease

    config.to_prepare do
      require 'redmine/plugin'

      spec = Bundler.environment.specs['openproject_release'][0]

      if OpenprojectRelease::OpenprojectRelease.release_time.present?
        ENV["RAILS_ASSET_ID"] = OpenprojectRelease::OpenprojectRelease.release_time.to_i.to_s
      end

      Redmine::Plugin.register :openproject_release do
        name 'OpenProject Release Plugin'
        author ((spec.authors.kind_of? Array) ? spec.authors[0] : spec.authors)
        author_url spec.homepage
        description spec.description
        version spec.version
      end
    end
  end
end
