# frozen_string_literal: true

module ::PandaPluginModule
  class PandaController < ::ApplicationController
    requires_plugin PandaPluginModule::PLUGIN_NAME

    def index
      Rails.logger.info "🐼 Panda Controller accessed!"

      respond_to do |format|
        format.html {
          # For Ember v5.12.0, we need to bootstrap the Ember app
          # This will load the Ember route and template
          render "default/empty"
        }
        format.json {
          render json: {
            message: "🐼 Panda Paradise",
            status: "working",
            time: Time.current,
            ember_version: "v5.12.0",
            plugin_version: "0.0.1"
          }
        }
      end
    rescue => e
      Rails.logger.error "🐼 Panda Error: #{e.message}"
      render plain: "Error: #{e.message}", status: 500
    end

    private

    def render_panda_html
      html_content = <<~HTML
        <!DOCTYPE html>
        <html>
        <head>
          <title>🐼 Panda Paradise</title>
          <meta charset="UTF-8">
          <style>
            body { font-family: Arial, sans-serif; text-align: center; padding: 50px; background: #f0f8ff; }
            h1 { color: #333; font-size: 3em; }
            p { color: #666; font-size: 1.2em; }
          </style>
        </head>
        <body>
          <h1>🐼 Panda Paradise</h1>
          <p>Welcome to the amazing world of pandas!</p>
          <p>Plugin is working correctly! 🎉</p>
          <a href="/">← Back to Forum</a>
        </body>
        </html>
      HTML

      render html: html_content.html_safe
    end
  end
end
