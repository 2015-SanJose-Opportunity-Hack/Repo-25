class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.admin?
      users_path
    elsif current_user.program_leader?
      curriculums_path
    else current_user.program_organizer?
      schedules_path
    end
  end
end
