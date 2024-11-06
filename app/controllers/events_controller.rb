class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end
  def index
    @event = Event.all
  end
end
