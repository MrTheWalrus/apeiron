class EventsController < ApplicationController
  layout false

  def index
    @events = Event.visible.all
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to admin_index_path
  end

  private

  def event_params
    params.require(:event).permit!
  end

end