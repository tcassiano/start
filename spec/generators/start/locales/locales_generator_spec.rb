require 'spec_helper'

require 'generators/start/locales/locales_generator'

describe Start::LocalesGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_application
  end

  describe 'the generated files' do
    before { run_generator %w(start:locales) }

    describe 'pt-br.yml' do
      subject { file('config/locales/pt-br.yml') }

      it { should exist }
    end

    describe 'devise.pt-br.yml' do
      subject { file('config/locales/devise.pt-br.yml') }

      it { should exist }
    end

    describe 'simple_form.pt-br.yml' do
      subject { file('config/locales/simple_form.pt-br.yml') }

      it { should exist }
    end
  end

  describe 'config/application.rb' do
    before { run_generator %w(start:locales) }
    subject { file('config/application.rb') }

    it { should contain(/config.time_zone = 'Brasilia'/) }
    it { should contain(/config.i18n.default_locale = 'pt-BR'/) }
  end
end