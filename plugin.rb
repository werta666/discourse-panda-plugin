# frozen_string_literal: true

# name: discourse-panda-plugin
# about: A Panda-themed plugin that adds a custom /panda page with interactive content
# meta_topic_id: TODO
# version: 0.0.1
# authors: Panda_CC
# url: TODO
# required_version: 2.7.0

enabled_site_setting :panda_plugin_enabled

module ::PandaPluginModule
  PLUGIN_NAME = "discourse-panda-plugin"
end

# Engine not needed for simple routing

after_initialize do
  # Register routes directly in Discourse
  Discourse::Application.routes.append do
    get "/panda" => "panda#index"
    get "/panda/test" => "panda#test"
    get "/panda/api" => "panda#api_data"
    get "/test-panda" => "test_panda#index"
  end
end
