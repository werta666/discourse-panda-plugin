# frozen_string_literal: true

module ::PandaPluginModule
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace PandaPluginModule
    config.autoload_paths << File.join(config.root, "lib")
  end
end
