class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:destroy, :update]

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
    if @event && !event_params.empty? && @event.update(event_params)
      render json: {event: @event}, status: :ok
    else 
      render json: {error: 'event could not be updated'}, status: :unprocessable_entity
    end    
  end

  def destroy
    if @event && @event.destroy
      render json: {event: @event}, status: :ok
    else 
      render json: {error: 'event could not be deleted'}, status: :unprocessable_entity
    end
  end

  private   

    def set_event
      @event = Event.find_by_id(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :start, :end, :allDay, :backgroundColor, :borderColor)
    end
end
