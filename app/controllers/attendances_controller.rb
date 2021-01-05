class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
    @users = User.all
  end

  def create
  end

  def show
  end
  
end
