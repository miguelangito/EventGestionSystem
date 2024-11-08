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
    @event = Event.new(params_events)
    respond_to do |format|
      if @event.save
        format.html { redirect_to all_events_path, notice: "Event was successfully created" }
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    @event = Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
    if @event.update(params_events)
      redirect_to event_path
    else
      render :edit
    end
  end
  def delete
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to all_events_path
    else
      flash[:error] = "Something went wrong"
      redirect_to event_path
    end
  end
  private
  def params_events
    params.require(:event).permit(:name, :date, :description)
  end
end
