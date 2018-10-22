class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_clasification

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    params[:goal][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @goal.users << manager unless @goal.users.include?(manager)
        end
      end
    end
    params[:goal][:involved_user_ids].each do |user_id|
      unless user_id.empty?
        user = User.find(user_id)
        unless user.nil?
          @goal.involved_users << user unless @goal.involved_users.include?(user)
        end
      end
    end
    respond_to do |format|
      if @goal.save
        log = Log.new
        log.save
        @goal.update(log_id: log.id)
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @goal.users.delete_all
    @goal.involved_users.delete_all
    params[:goal][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @goal.users << manager unless @goal.users.include?(manager)
        end
      end
    end
    params[:goal][:involved_user_ids].each do |user_id|
      unless user_id.empty?
        user = User.find(user_id)
        unless user.nil?
          @goal.involved_users << user unless @goal.involved_users.include?(user)
        end
      end
    end
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:year, :goal_number, :name, :description, :state, :estimated_end_date, :end_date, :privacy, :log)
    end

    def set_clasification
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
