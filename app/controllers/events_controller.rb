class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def search
  	event = Event.new 
  	@events = event.process(params[:q])
  end

  def show
  end

  def new
  	@event = Event.new
  end

  
end








