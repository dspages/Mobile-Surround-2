require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MobileSurround
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    AWS::S3::Base.establish_connection!(
      :access_key_id     => 'ACCESS_KEY_ID',
      :secret_access_key => 'SECRET_ACCESS_KEY'
    )
  end
end
