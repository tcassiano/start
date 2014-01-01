require 'spec_helper'

require 'generators/start/heroku_wake_up/heroku_wake_up_generator'

describe Start::HerokuWakeUpGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_application
    copy_development
    copy_gemfile
  end

  describe 'the generated files' do
    before { run_generator %w(start:heroku_wake_up) }

    describe 'initializer' do
      subject { file('config/initializers/heroku_wake_up.rb') }

      it { should exist }
    end
  end

  describe 'Gemfile' do
    before { run_generator %w(start:heroku_wake_up) }
    subject { file('Gemfile') }

    it { should contain(/gem "rufus-scheduler", "~> 3.0.3", group: :production/) }
  end

end