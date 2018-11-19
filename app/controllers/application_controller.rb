class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_user_id

  def index
    if user_signed_in?
    	@user_tasks = Task.where('user_id = ?', current_user.id)
    end
  end

  def enter_log_message(message, log_id, privacy)
    log_entry = LogEntry.new(log_id: log_id, message: message, user_id: current_user.id, privacy: privacy)
    log_entry.save
  end

  def get_user_id
    @current_user_id = current_user.id
  end

end
