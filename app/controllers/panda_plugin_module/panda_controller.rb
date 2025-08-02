# frozen_string_literal: true

module ::PandaPluginModule
  class PandaController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    def index
      render json: { message: "🐼 Panda Paradise", status: "working", time: Time.current }
    end
  end
end
