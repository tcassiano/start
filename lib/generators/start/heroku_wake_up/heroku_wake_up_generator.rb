class Start::HerokuWakeUpGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def add_gems
    gem 'rufus-scheduler',   '~> 2.0.19', group: :production
  end

  def copy_files
    copy_file 'config/initializers/heroku_wake_up.rb', 'config/initializers/heroku_wake_up.rb'
  end
end
