class EventsController < ApplicationController
  before_action :find_event, only: [:show]

  def show
  end

  private

  def find_event
    @event = Event.find_by(id: params[:id])
  end
end
