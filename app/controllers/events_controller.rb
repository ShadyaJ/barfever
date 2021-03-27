class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show]

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def find_event
    @event = Event.find_by(id: params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name, :category, :description, :price
    )
  end
end
