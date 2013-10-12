class Start::LocalesGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def config_application
    application "config.time_zone = 'Brasilia'"
    application "config.i18n.default_locale = 'pt-BR'"
  end

  def copy_files
    copy_file 'config/locales/pt-br.yml', 'config/locales/pt-br.yml'
    copy_file 'config/locales/devise.pt-br.yml', 'config/locales/devise.pt-br.yml'
    copy_file 'config/locales/simple_form.pt-br.yml', 'config/locales/simple_form.pt-br.yml'
  end
end
