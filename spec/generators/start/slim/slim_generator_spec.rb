require 'spec_helper'

require 'generators/start/slim/slim_generator'

describe Start::SlimGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_application
    copy_development
    copy_gemfile
  end

  describe 'the generated files' do
    before { run_generator %w(start:slim) }

    describe 'the layout' do
      subject { file('app/views/layouts/application.html.slim') }

      it { should exist }
    end
  end

  describe 'config/application.rb' do
    before { run_generator %w(start:slim) }
    subject { file('config/application.rb') }

    it { should contain(/Slim::Engine.set_default_options format: :html5/) }
  end

  describe 'config/environments/development.rb' do
    before { run_generator %w(start:slim) }
    subject { file('config/environments/development.rb') }

    it { should contain(/Slim::Engine.set_default_options pretty: true, sort_attrs: false/) }

    it { should contain(/Slim::Engine.set_default_options tabsize: 2/) }
  end

  describe 'Gemfile' do
    before { run_generator %w(start:slim) }
    subject { file('Gemfile') }

    it { should contain(/gem "slim-rails", "~> 2.0.1"/) }
  end

end