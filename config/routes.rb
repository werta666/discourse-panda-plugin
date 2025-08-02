# frozen_string_literal: true

PandaPluginModule::Engine.routes.draw do
  get "/examples" => "examples#index"
  get "/" => "panda#index"
  get "/api" => "panda#api_data"
  get "/test" => "test#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::PandaPluginModule::Engine, at: "panda" }
