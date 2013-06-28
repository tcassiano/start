class UnicornGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def add_gems
    gem 'unicorn',      '~> 4.6.2'
    gem 'rack-timeout', '~> 0.0.4'
  end

  def copy_files
    copy_file 'config/unicorn.rb', 'config/unicorn.rb'
    copy_file 'config/initializers/timeout.rb', 'config/initializers/timeout.rb'
    copy_file 'Procfile', 'Procfile'
    # TODO: add lines to .env instead of copying the role file
    copy_file '.env', '.env'
  end
end
