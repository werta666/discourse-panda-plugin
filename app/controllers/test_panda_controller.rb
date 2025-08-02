# frozen_string_literal: true

class TestPandaController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    render plain: "🐼 Simple Panda Test - No plugin dependency"
  end
end
