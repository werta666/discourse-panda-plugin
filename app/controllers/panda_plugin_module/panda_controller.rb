# frozen_string_literal: true

module ::PandaPluginModule
  class PandaController < ::ApplicationController
    requires_plugin PandaPluginModule::PLUGIN_NAME

    def index
      Rails.logger.info "🐼 Panda Controller accessed!"

      # Bootstrap the Ember app for /panda route
      render "default/empty"
    rescue => e
      Rails.logger.error "🐼 Panda Error: #{e.message}"
      render plain: "Error: #{e.message}", status: 500
    end
  end
end
