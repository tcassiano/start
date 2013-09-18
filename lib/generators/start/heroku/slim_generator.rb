class Start::HerokuGenerator < Rails::Generators::Base
  def add_gems
    gem 'rails_12factor', group: :production
  end
end
