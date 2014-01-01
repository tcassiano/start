require 'spec_helper'

require 'generators/start/unicorn/unicorn_generator'

describe Start::UnicornGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_gemfile
  end

  describe 'the generated files' do
    before { run_generator %w(start:unicorn) }

    describe 'unicorn.rb' do
      subject { file('config/unicorn.rb') }

      it { should exist }
    end

    describe 'timeout.rb' do
      subject { file('config/initializers/timeout.rb') }

      it { should exist }
    end

    describe 'Procfile' do
      subject { file('Procfile') }

      it { should exist }
    end

    describe '.env' do
      subject { file('.env') }

      it { should exist }
    end
  end

  describe 'Gemfile' do
    before { run_generator %w(start:unicorn) }
    subject { file('Gemfile') }

    it { should contain(/gem "unicorn", "~> 4.7.0"/) }
    it { should contain(/gem "rack-timeout", "~> 0.0.4"/) }
  end
end




