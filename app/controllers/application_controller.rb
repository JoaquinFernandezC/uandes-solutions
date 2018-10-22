class ApplicationController < ActionController::Base
  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in?
    	@user_tasks = Task.where('user_id = ?', current_user.id)
    end
  end
end
