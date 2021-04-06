class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show]

  def show
    @event = Event.find(params[:id])
    @redirection = params[:redirection]
  end

  def index
    if params[:tag_category]
      @events = Event.where(category: params[:tag_category])
    elsif params[:tag_price]
      @events = Event.all.sort_by &:price
    else
      @events = Event.all
    end
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
