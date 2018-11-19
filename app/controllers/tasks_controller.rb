require 'date'
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_theme, only: :new

  # GET /tasks
  # GET /tasks.json
  require 'ostruct'
  def index


    @privacy_by_id = Hash[PrivacyLevel.all.collect{|p| [p.id,p.tag]} ]
    filter=params[:filter]
    @filtered = false
      
    @tasks= Adapters::TaskPrivacyFilter.get_tasks(current_user)

    if !filter.nil?
      task_name = filter[:name]
      if !task_name.nil? && task_name!=""
        @filtered = true
        task_name = task_name.strip()
        @tasks =  @tasks.where("name LIKE '%#{task_name}%'")
      end
      puts "task name: #{task_name}"
      assigned_ids = Array(filter[:assigned_ids])
      assigned_ids.delete("")
      if !assigned_ids.empty?
        @filtered = true

        @tasks= @tasks.where(user:assigned_ids)
      end
      statuses= Array(filter[:status])
      statuses.delete("")
      if !statuses.empty?
        @filtered = true

        statuses_tags=Status.where(id:statuses).collect{|r| r.tag}
        @tasks=@tasks.where(state:statuses_tags)
      end

      privacy = Array(filter[:privacy])
      privacy.delete("")
      puts privacy




      if !privacy.empty?
        @filtered = true

        puts "FILTERING PRIVACY"
        @tasks=@tasks.where(privacy:privacy)
      end

      min_start_date, max_start_date = filter[:min_start_date],filter[:max_start_date]

      if min_start_date!="" and !min_start_date.nil?
        @filtered = true

        min_start_date = min_start_date.to_date.beginning_of_day
        puts min_start_date
        puts "FILTERING BEGIN DATE"

        puts @tasks.length
        puts @tasks.count

        @tasks= @tasks.where("start_date>=?",min_start_date)
        puts @tasks.count
        puts @tasks.length
      end

      if max_start_date!="" and !max_start_date.nil?
        puts "FILTERING END DATE"
        @filtered = true

        max_start_date=max_start_date.to_date.end_of_day
        @tasks= @tasks.where("start_date::date <=?",max_start_date.to_date.to_datetime)


      end

    else

      @tasks = Task.all


    end
    @filter = if filter.nil? then nil else OpenStruct.new(filter) end
    puts(@filter)
  end

  def report
    open_status_tag=Status.find_by_tag("Abierto").tag
    @users = User.all.collect{|u| [u.email,u.tasks.where(state:open_status_tag).count,tasks_path(:filter=>{assigned_ids:[u.id]})]}

  end


  def report_csv
    open_status =Status.find_by_tag("Abierto")

    @users = User.all
    csv = ""
    @users.each do |user|

      row = user.email
      row +=","
      open_task_count = user.tasks.where(state:open_status.tag).count
      if open_task_count == 0

        #next
      end

      row += "#{open_task_count}"
      csv += row
      csv +="\n"

    end
    send_data csv, filename: "tasks-report-#{Date.today}.csv"
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show

    @log = Log.find(@task.log_id)
    enter_log_message('Se accedió a la tarea de nombre "' + @task.name + '".', @task.log_id, @task.privacy)
    @get_theme_name = get_theme(@task.id)
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
    elsif @task.needs_checking and Status.find_by_tag(@task.state).tag == "Revisión"
      @posible_state =Status.where.not(tag: "Revisión")
    else
      @posible_state =Status.all
    end
    if Status.find_by_tag(@task.state).tag == "Cerrado"

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
        entry = LogEntry.new(log_id: log.id, user_id: current_user.id, privacy: @task.privacy)
        entry.message = "Se ha creado la tarea " + @task.name
        entry.save
        if !@theme.nil?

          @theme.tasks<<@task

        end
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


    def get_theme(id)
      iicId = IicTask.where(task_id: id).select(:iic_id).first
      causeId = CaseTask.where(task_id: id).select(:cause_id).first
      ccId = CcTask.where(task_id: id).select(:case_coordination_id).first

      if IicTask.where(task_id: id).exists?
         return Iic.find(iicId.iic_id).name
      end
      if CaseTask.where(task_id: id).exists?
        return  Cause.find(causeId.cause_id).name
      end
      if CcTask.where(task_id: id).exists?
        return CaseCoordination.find(ccId.case_coordination_id).name
      end
    end

    def set_task
      @task = Task.find(params[:id])
      @privacy_level =PrivacyLevel.find(@task.privacy)
      @state = Status.find_by_tag(@task.state)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      set_theme
      params.require(:task).permit(:name, :description, :user_id, :start_date, :estimated_end_date, :end_date, :privacy, :priority, :state, :needs_checking,  documents_attributes: [:name, :file, :version, :docType, :classification])

    end
end
