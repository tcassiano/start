class SlimGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def add_gems
    gem 'slim-rails', '~> 2.0.1'
  end

  def copy_files
    # copy_file 'config/unicorn.rb', 'config/unicorn.rb'

    application do
      "Slim::Engine.set_default_options format: :html5"
    end

    application(nil, env: "development") do
      "Slim::Engine.set_default_options pretty: true, sort_attrs: false"
    end

    application(nil, env: "development") do
      "Slim::Engine.set_default_options tabsize: 2"
    end

  end
end
