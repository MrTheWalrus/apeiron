class EventsController < ApplicationController
  layout false

  def index
    @events = Event.visible.all
  end

  def update
    @event = event.find(params[:id])
    @event.update(event_params)
  end

  private

  def event_params
    params.require(:event).permit!
  end

end