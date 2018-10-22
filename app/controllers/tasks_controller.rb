class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_theme, only: :new

  # GET /tasks
  # GET /tasks.json
  def index
    filter=params[:filter]
    @tasks=Task.all
    if !filter.nil?
      tasks_ids = filter[:tasks_ids]

      tasks_ids.delete("")
      if !tasks_ids.empty?
        @tasks= @tasks.where(id:tasks_ids)
      end

      assigned_ids = Array(filter[:assigned_ids])
      assigned_ids.delete("")
      if !assigned_ids.empty?
        @tasks= @tasks.where(user:assigned_ids)
      end

    else

      @tasks = Task.all

    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show

    @log = Log.find(@task.log_id)
    enter_log_message('Se accedió a la tarea de nombre "' + @task.name + '".', @task.log_id, @task.privacy)

  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def work
    @task = Task.find(params[:id])

    if !@task.needs_checking
      @posible_state = Status.where.not(tag: "Revisión")
    else
      @posible_state = Status.all
    end
    if Status.find(@task.state).tag == "Cerrado"

      redirect_to(root_path, notice: 'No puede trabajar una tarea cerrada' )
    end
    @@priority = { 1 => 'Baja', 2 => 'Media', 3 => 'Alta', 3 => 'Urgente'}

    @priority_task = @@priority[@task.priority]

  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save

        log= Log.create()
        @task.update(log_id:log.id)
        @theme.tasks<<@task
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }

      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end


  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
        enter_log_message('Se editó la tarea de nombre "' + @task.name + '".', @task.log_id, @task.privacy)
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó la tarea de nombre "' + @task.name + '".', @task.log_id, @task.privacy)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme_id = params[:theme_id]
      @theme_name= params[:theme_name]
      @theme=nil
      if @theme_name==Iic.NAME
        @theme=Iic.find_by_id(@theme_id)
      elsif @theme_name==Cause.NAME
        @theme=Cause.find(@theme_id)
      elsif @theme_name==Goal.NAME
        @theme=Goal.find(@theme_id)
      elsif @theme_name==Project.NAME
        @theme=Project.find(@theme_id)
      elsif @theme_name==Derivation.NAME
        @theme=Derivation.find(@theme_id)
      elsif @theme_name==CaseCoordination.NAME
        @theme=CaseCoordination.find(@theme_id)
      end

      if @theme.nil?
        puts "theme nil"
      end
    end

    def set_task
      @task = Task.find(params[:id])

      @privacy_level =PrivacyLevel.find(@task.privacy)
      @state = Status.find(@task.state)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      set_theme
      params.require(:task).permit(:name, :description, :user_id, :start_date, :estimated_end_date, :end_date, :privacy, :priority, :state, :needs_checking,  documents_attributes: [:name, :file, :version, :docType, :classification])
    end
end
