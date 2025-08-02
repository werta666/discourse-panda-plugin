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

require_relative "lib/panda_plugin_module/engine"

after_initialize do
  # 按照官方标准添加路由
  Discourse::Application.routes.append do
    get '/panda' => 'panda_plugin_module/panda#index'
  end
end
