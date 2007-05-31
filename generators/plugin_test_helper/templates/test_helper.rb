# If you want to change the default rails environment
# ENV['RAILS_ENV'] ||= 'your_env'

# Load the plugin testing framework
require 'plugin_test_helper'

# Load the Rails environment
require 'config/environment'

# Load the unit testing framework
require 'test/unit'

# Run the migrations (optional)
ActiveRecord::Migrator.migrate("#{RAILS_ROOT}/db/migrate")