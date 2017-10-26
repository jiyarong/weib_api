class Api::V1::TriggersController < ApplicationController
  def index
    @triggers = Trigger.all
    render json: @triggers, each_serializer: TriggerSerializer
  end
end
