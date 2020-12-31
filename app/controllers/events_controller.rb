class EventsController < ApplicationController
  before_action :logged_in?, except: [:index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = "Event successfully created!"
        redirect_to root_path
      else
        format.html { render :new }
      end
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :creator_id)
  end

end
