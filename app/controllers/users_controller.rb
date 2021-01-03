class UsersController < ApplicationController
  before_action :set_user, Only: [:show, :edit, :update,:destroy]

  def index
    @users = User.all
    @current_user = session['current_user']
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was Successfully created' }
        format.json { render :show, status: :created,  location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @created_event = @user.events
    @upcoming = Event.upcoming.select do |event|
      event.attendances.where('status = ?', true).where('attendee_id = ?', @user.id)
    end
    @past = Event.past.select do |event|
      event.attendances.where('status = ?', true).where('attendee_id = ?', @user.id)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end

end
