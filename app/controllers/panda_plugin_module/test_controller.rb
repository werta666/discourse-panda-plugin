# frozen_string_literal: true

module ::PandaPluginModule
  class TestController < ::ApplicationController
    requires_plugin PLUGIN_NAME
    skip_before_action :verify_authenticity_token

    def index
      render plain: "🐼 Panda Plugin Test - This is working!"
    end
  end
end
