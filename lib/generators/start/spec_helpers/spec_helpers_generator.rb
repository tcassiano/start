class Start::SpecHelpersGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  def copy_files
    copy_file 'spec/support/features/session_helpers.rb', 'spec/support/features/session_helpers.rb'
    copy_file 'spec/support/requests/session_helpers.rb', 'spec/support/requests/session_helpers.rb'
    copy_file 'spec/support/deferred_garbage_collection.rb', 'spec/support/deferred_garbage_collection.rb'
  end

  def config_spec_helper
    append_to_file 'spec/spec_helper.rb' do
      <<-CONFIG.strip_heredoc
        RSpec.configure do |config|
          config.include Features::SessionHelpers, type: :feature
          config.include Requests::SessionHelpers

          # Deferred Garbage Collection for faster specs
          config.before(:all) do
            DeferredGarbageCollection.start
          end

          config.after(:all) do
            DeferredGarbageCollection.reconsider
          end
        end
      CONFIG
    end
  end
end
