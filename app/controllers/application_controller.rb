class ApplicationController < ActionController::API
  before_action :set_response

  private

  def set_response
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
  end
end
