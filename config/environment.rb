RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'gravtastic', :version => '>= 2.1.0'
  config.gem 'friendly_id'
  config.gem 'RedCloth'
  config.gem 'rakismet'
  config.plugins = [ :all ]
  config.action_controller.session_store = :active_record_store
  config.time_zone = 'UTC'
end

require 'friendly_id'