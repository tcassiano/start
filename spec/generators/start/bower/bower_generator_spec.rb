require 'spec_helper'
require 'generators/start/bower/bower_generator'

describe Start::BowerGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
  end

  describe 'the generated files' do
    before { run_generator %w(start:bower) }

    describe '.bowerrc' do
      subject { file('.bowerrc') }

      it { should exist }
    end
  end
end