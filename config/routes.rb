# frozen_string_literal: true

PandaPluginModule::Engine.routes.draw do
  get "/" => "panda#index"
  get ".json" => "panda#index"
  get "/test" => "test#index"
end
