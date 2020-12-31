class ApplicationController < ActionController::Base

  private

# Finds the User with the ID stored in the session with the key
# :current_user_id This is a common way to handle user login in
# a Rails application; logging in sets the session value and
# logging out removes it.
  def current_user
    User.where(id: session[:current_user_id]).first
  end

  helper_method :current_user
end
