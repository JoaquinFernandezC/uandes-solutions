class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :get_privacy_levels

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @log = Log.find(@project.log_id)
    enter_log_message('Se accedió al proyecto de nombre "' + @project.name + '".', @project.log_id, @project.privacy)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    params[:project][:employee_ids].each do |manager_id|
      unless manager_id.empty?
        employee = Employee.find(manager_id)
        unless employee.nil?
          @project.employees << employee unless @project.employees.include?(employee)
        end
      end
    end
    params[:project][:user_ids].each do |user_id|
      unless user_id.empty?
        user = User.find(user_id)
        unless user.nil?
          @project.users << user unless @project.users.include?(user)
        end
      end
    end
    respond_to do |format|
      if @project.save
        log = Log.new
        log.save
        @project.update(log_id: log.id)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        enter_log_message('Se creó un nuevo proyecto con nombre "' + @project.name + '".', @project.log_id, @project.privacy)
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.employees.delete_all
    @project.users.delete_all
    params[:project][:employee_ids].each do |manager_id|
      unless manager_id.empty?
        employee = Employee.find(manager_id)
        unless employee.nil?
          @project.employees << employee unless @project.employees.include?(employee)
        end
      end
    end
    params[:project][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @project.users << manager unless @project.users.include?(manager)
        end
      end
    end
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
        enter_log_message('Se editó proyecto de nombre "' + @project.name + '".', @project.log_id, @project.privacy)
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó proyecto de nombre "' + @project.name + '".', @project.log_id, @project.privacy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:year, :project_number, :name, :objective, :state, :start_date, :estimated_end_date, :end_date, :privacy, :log)
    end

    def get_privacy_levels
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
