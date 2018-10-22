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
<<<<<<< HEAD


=======
    @log = Log.find(@task.log_id)
    enter_log_message('Se accedió a la tarea de nombre "' + @task.name + '".', @task.log_id, @task.privacy)
>>>>>>> c6b8970a4cc1ddf6b9dcf5ca43a5a8a85a60a81a
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
<<<<<<< HEAD
        log= Log.create()
        @task.update(log_id:log.id)
        @theme.tasks<<@task
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }

=======
        log = Log.new
        log.save
        @task.update(log_id: log.id)
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
        enter_log_message('Se creó una nueva tarea con nombre "' + @task.name + '".', @task.log_id, @task.privacy)
>>>>>>> c6b8970a4cc1ddf6b9dcf5ca43a5a8a85a60a81a
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
      elsif @theme_name=='cause'
        @theme=Cause.find(@theme_id)
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
      params.require(:task).permit(:name, :description, :user_id, :start_date, :estimated_end_date, :end_date, :privacy, :priority, :state, :needs_checking)
    end
end
