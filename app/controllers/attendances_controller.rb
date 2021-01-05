class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def create
    user_id = params[:user_id]
    event = Event.find(params[:event_id])
    @invite = Attendance.new(attended_event_id: event.id, attendee_id: user_id)

    if @invite.save
      @invite.invited!
      flash[:notice] = 'INVITATION IS SENT SUCCESSFULLY!'
    else
      flash[:alert] = 'SOMETHING WENT WRONG!.'
    end

    redirect_to attendances_path(event_id: event.id)
  end

  def show
  end

end
