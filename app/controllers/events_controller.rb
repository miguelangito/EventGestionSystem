class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(create_params)
    if @event.save
      redirect_to all_events_path
    else
      render :new
    end
  end
  def update
    
  end
  private
  def create_params
    params.require(:event).permit(:name, :date, :description)
  end
end
