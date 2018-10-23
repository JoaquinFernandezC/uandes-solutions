require 'date'
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_theme, only: :new

  # GET /tasks
  # GET /tasks.json
  def index

    @privacy_by_id = Hash[PrivacyLevel.all.collect{|p| [p.id,p.tag]} ]

    puts @privacy_by_id
    puts "hola"
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

      statuses= Array(filter[:status])
      statuses.delete("")
      if !statuses.empty?
        @tasks=@tasks.where(state:statuses)
      end

      privacy = Array(filter[:privacy])
      privacy.delete("")
      puts privacy



      puts "FILTERING PRIVACY"
      if !privacy.empty?
        @tasks=@tasks.where(privacy:privacy)
      end

      min_start_date, max_start_date = filter[:min_start_date],filter[:max_start_date]

      if min_start_date!="" and !min_start_date.nil?

        min_start_date = min_start_date.to_date.beginning_of_day
        puts min_start_date
        puts "FILTERING dATE"

        puts @tasks.length
        @tasks= @tasks.where("start_date>?",min_start_date)

        puts @tasks.length
      end

      if max_start_date!="" and !max_start_date.nil?
        puts "FILTERING dATE"

        max_start_date=max_start_date.to_date.end_of_day
       @tasks= @tasks.where("start_date::date <?",max_start_date.to_date.to_datetime)


      end



    else

      @tasks = Task.all

    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show


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
