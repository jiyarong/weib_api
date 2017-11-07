class OptionConfigsController < ApplicationController
  def options
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    head :ok
  end
end
