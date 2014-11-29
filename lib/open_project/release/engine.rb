module OpenProject::Release
  class Engine < ::Rails::Engine
    engine_name :openproject_release
    config.autoload_paths += Dir["#{config.root}/lib/"]

    initializer 'release.register_test_paths' do |app|
      app.config.plugins_to_test_paths << root
    end

    config.to_prepare do
      require 'redmine/plugin'
      require 'open_project/footer'
      require 'open_project/release/hooks'

      spec = Bundler.environment.specs['openproject-release'][0]

      if OpenProject::Release.release_time.present?
        ENV['RAILS_ASSET_ID'] = OpenProject::Release.release_time.to_i.to_s
      end

      unless Redmine::Plugin.registered_plugins.include?(:openproject_release)
        Redmine::Plugin.register :openproject_release do
          name 'OpenProject Release Plugin'
          author ((spec.authors.is_a? Array) ? spec.authors[0] : spec.authors)
          author_url spec.homepage
          description spec.description
          version OpenProject::Release::VERSION

          requires_openproject '>= 4.0.0'

          OpenProject::Footer.add_content('release_version', Proc.new { I18n.t('op_release_current_version', version: OpenProject::Release.version) if User.current.admin? })
          OpenProject::Footer.add_content('release_date', Proc.new { I18n.t('op_release_last_update', released_at: OpenProject::Release.release_date) })
        end
      end
    end
  end
end
