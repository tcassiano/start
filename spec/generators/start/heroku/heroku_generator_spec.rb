require 'spec_helper'
require 'generators/start/heroku/heroku_generator'

describe Start::HerokuGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_gemfile
  end

  describe 'Gemfile' do
    before { run_generator %w(start:slim) }
    subject { file('Gemfile') }

    it { should contain(/gem "rails_12factor"/) }
  end
end