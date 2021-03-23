class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show]

  def show
  end

  def index
    @events = Event.all
  end

  private

  def find_event
    @event = Event.find_by(id: params[:id])
  end
end
