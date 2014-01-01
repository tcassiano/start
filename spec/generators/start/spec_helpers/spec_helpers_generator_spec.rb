require 'spec_helper'

require 'generators/start/spec_helpers/spec_helpers_generator'

describe Start::SpecHelpersGenerator do
  destination File.expand_path("../../../../../tmp", __FILE__)

  before do
    prepare_destination
    copy_spec_helper
  end

  describe 'the generated files' do
    before { run_generator %w(start:spec_helpers) }

    it 'generates features/session_helpers.rb' do
      file('spec/support/features/session_helpers.rb').should exist
    end

    it 'generates requests/session_helpers.rb' do
      file('spec/support/requests/session_helpers.rb').should exist
    end

    it 'generates deferred_garbage_collection.rb' do
      file('spec/support/deferred_garbage_collection.rb').should exist
    end
  end

  describe 'spec_helper.rb' do
    before { run_generator %w(start:spec_helpers) }
    subject { file('spec/spec_helper.rb') }

    it { should contain(/config.include Features::SessionHelpers, type: :feature/) }
    it { should contain(/config.include Requests::SessionHelpers/) }
    it { should contain(/DeferredGarbageCollection.start/) }
    it { should contain(/DeferredGarbageCollection.reconsider/) }
  end
end