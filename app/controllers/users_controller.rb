class UsersController < ApplicationController
  before_action :get_user_types
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  require 'util'
  def show
    @query_parameters = request.query_parameters
    @filter = params[:filter]
    @filtered = false
    causes =Cause.all
    derivs = Derivation.all
    iics = Iic.all
    proys =Project.all
    ccs =CaseCoordination.all
    goals = Goal.all
    if @filter

      date_from = @filter[:date_from]
      if !date_from.nil? && date_from!=""
        @filtered = true
        # goals, causes, case_coordinations
        derivs = derivs.where("work_start_date>='#{date_from}' OR work_start_date IS NULL" )
        proys = proys.where("start_date>='#{date_from}' OR start_date IS NULL")
        iics = iics.where("start_date>='#{date_from}' OR start_date IS NULL")
      end

      date_until = @filter[:date_until]

      if !date_until.nil? && date_until!=""
        @filtered = true
        sql = "end_date<='#{date_until}' OR end_date is NULL"
        causes =causes.where(sql)
        derivs = derivs.where(sql)
        iics = iics.where(sql)
        proys = proys.where(sql)
        ccs = ccs.where(sql)
        goals = goals.where(sql)
      end
    end

    @tasks = Task.all

    @filter = if @filter.nil? then nil else OpenStruct.new(@filter) end

    respond_to do |format|
      format.html # show.html.erb
      format.csv {
        csv = "Funcionario,Tarea,Tema,Fecha Inicio,Fecha Termino,Tiempo\n"
        @tasks.each do |task|
          row = ""
          row += task.user.name
          row = ""
          row += task.name
          row +=","
          row += if !task.get_theme.nil? then task.get_theme.name else "Sin definir" end
          row +=","
          row += if task.class.method_defined? :start_date then ( if !task.start_date.nil? then task.start_date.to_date.to_s else "Sin definir" end) else "N/A" end
          row +=","
          row += if !task.end_date.nil? then task.end_date.to_date.to_s else "Sin definir" end
          row +=","
          row += if !task.end_date.nil? and !task.start_date.nil? then (((task.end_date-task.start_date).to_i)/86400).to_s else "N/A" end + " Dias"
          row += "\n"
          csv+=row
        end
        send_data csv,filename:"user-report-#{Date.today}.csv"}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to admin_users_path, notice: "User succesfully created!" 
    else
        render :new
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
	  params[:user].delete(:password)
	end
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Updated User."
    else
      render :edit
    end
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :rut, :email, :position, :rol, :password)
  end
  def get_user_types
    @user_types = ['Director','TI','Secretaría','Funcionario','Temporal']
  end
end
