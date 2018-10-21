class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
  end

  def enter_log_message(message, log_id, privacy)
    log_entry = LogEntry.new(log_id: log_id, message: message, user_id: current_user.id, privacy: privacy)
    log_entry.save
  end

end
