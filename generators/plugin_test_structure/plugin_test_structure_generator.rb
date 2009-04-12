require 'plugin_test_helper/generator'

# Generates the test structure for a plugin with no dependencies on the
# plugin_test_helper library
class PluginTestStructureGenerator < Rails::Generator::Base
  include PluginTestHelper::Generator
  
  def manifest #:nodoc:
    record do |m|
      # Paths are relative to our template dir
      templates_root = "#{File.dirname(__FILE__)}/templates"
      
      # Root test directory
      m.directory plugin_test_root
      
      # Copy all directories and files.  None of them are templated so that they
      # can be reused during runtime
      Dir["#{templates_root}/**/*"].each do |source_file|
        relative_source_file = source_file.sub(templates_root, '')
        target_file = File.join(plugin_test_root, relative_source_file)
        
        if File.directory?(source_file)
          m.directory target_file
        else
          m.file relative_source_file, target_file
        end
      end
    end
  end

  protected
    def banner
      "Usage: #{$0} plugin_test_structure your_plugin"
    end
end
