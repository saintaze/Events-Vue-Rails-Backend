class Api::V1::EventsController < ApplicationController
  
  def index
    @events = Event.all
    render json: {events: @events}, status: :ok
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {event: @event}, status: :created
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private 

    def event_params
      params.require(:event).permit(:title, :start, :end, :allDay, :backgroundColor, :borderColor)
    end
end
