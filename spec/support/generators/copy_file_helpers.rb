module Generators
  module CopyFileHelpers
    def copy_application
      application = File.expand_path('../../../dummy/config/application.rb', __FILE__)
      destination = File.join(destination_root, 'config')

      FileUtils.mkdir_p(destination)
      FileUtils.cp application, destination
    end

    def copy_development
      development = File.expand_path('../../../dummy/config/environments/development.rb', __FILE__)
      destination = File.join(destination_root, 'config', 'environments')

      FileUtils.mkdir_p(destination)
      FileUtils.cp development, destination
    end

    def copy_gemfile
      gemfile = File.expand_path('../../../../Gemfile', __FILE__)
      FileUtils.cp gemfile, destination_root
    end
  end
end