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

    it 'configs Slim formating to html5' do
      subject.should contain(/Slim::Engine.set_default_options format: :html5/)
    end
  end

  describe 'config/environments/development.rb' do
    before { run_generator %w(start:slim) }
    subject { file('config/environments/development.rb') }

    it 'configs Slim formating to pretty' do
      subject.should contain(/Slim::Engine.set_default_options pretty: true, sort_attrs: false/)
    end

    it 'configs Slim tabsize to 2' do
      subject.should contain(/Slim::Engine.set_default_options tabsize: 2/)
    end
  end

  describe 'Gemfile' do
    before { run_generator %w(start:slim) }
    subject { file('Gemfile') }

    it 'adds "slim-rails" gem' do
      subject.should contain(/gem "slim-rails", "~> 2.0.1"/)
    end
  end

  def copy_application
    application = File.expand_path('../../../../dummy/config/application.rb', __FILE__)
    destination = File.join(destination_root, 'config')

    FileUtils.mkdir_p(destination)
    FileUtils.cp application, destination
  end

  def copy_development
    development = File.expand_path('../../../../dummy/config/environments/development.rb', __FILE__)
    destination = File.join(destination_root, 'config', 'environments')

    FileUtils.mkdir_p(destination)
    FileUtils.cp development, destination
  end

  def copy_gemfile
    gemfile = File.expand_path('../../../../../Gemfile', __FILE__)
    FileUtils.cp gemfile, destination_root
  end
end