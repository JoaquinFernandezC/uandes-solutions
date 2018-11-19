class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :get_user_id

  def index
    if user_signed_in?
    	my_tasks = Task.where('user_id = ?', current_user.id).where('state = ?', "Abierto")
      review_tasks = []
      user_causes = current_user.causes
      user_causes.each do |cause|
        review_tasks = review_tasks + cause.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end

      user_cc = current_user.case_coordinations
      user_cc.each do |cc|
        review_tasks = review_tasks + cc.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end

      user_iic = current_user.iic_management
      user_iic.each do |iic|
        review_tasks = review_tasks + iic.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end

      user_goals = current_user.goals
      user_goals.each do |goals|
        review_tasks = review_tasks + goals.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end

      user_projects = current_user.projects
      user_projects.each do |project|
        review_tasks = review_tasks + project.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end

      user_derivations = current_user.derivation_management
      user_derivations.each do |dm|
        review_tasks = review_tasks + dm.tasks.where('needs_checking = ?', true).where('state = ?', "Revisión")
      end
      
      @user_tasks = (my_tasks + review_tasks).uniq
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
