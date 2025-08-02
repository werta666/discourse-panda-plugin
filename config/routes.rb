# frozen_string_literal: true

PandaPluginModule::Engine.routes.draw do
  get "/" => "panda#index"
end
