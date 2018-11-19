class IicsController < ApplicationController
  before_action :set_iic, only: [:show, :edit, :update, :destroy]
  before_action :get_privacy_levels

  # GET /iics
  # GET /iics.json
  def index
    if current_user.rol < 4
      @iics = Iic.all
    else
      @iics = Adapters::IicPrivacyFilter.get_iic(current_user)
    end
  end

  # GET /iics/1
  # GET /iics/1.json
  def show
    @log = Log.find(@iic.log_id)
    enter_log_message('Se accedió la coordinación interinstitucional de nombre "' + @iic.name + '".', @iic.log_id, @iic.privacy)
  end

  # GET /iics/new
  def new
    @iic = Iic.new
  end

  # GET /iics/1/edit
  def edit
  end

  # POST /iics
  # POST /iics.json
  def create
    @iic = Iic.new(iic_params)
    params[:iic][:manager_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @iic.managers << manager unless @iic.managers.include?(manager)
        end
      end
    end
    params[:iic][:internal_member_ids].each do |member_id|
      unless member_id.empty?
        internal_member = User.find(member_id)
        @iic.internal_members << internal_member unless @iic.internal_members.include?(internal_member)
      end
    end
    params[:iic][:external_member_ids].each do |member_id|
      unless member_id.empty?
        external_member = Employee.find(member_id)
        @iic.external_members << external_member unless @iic.external_members.include?(external_member)
      end
    end
    respond_to do |format|
      if @iic.save
        log = Log.new
        log.save
        @iic.update(log_id: log.id)
        format.html { redirect_to @iic, notice: 'Iic was successfully created.' }
        format.json { render :show, status: :created, location: @iic }
        enter_log_message('Se creó una nueva coordinación interinstitucional con nombre "' + @iic.name + '".', @iic.log_id, @iic.privacy)
      else
        format.html { render :new }
        format.json { render json: @iic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iics/1
  # PATCH/PUT /iics/1.json
  def update
    @iic.managers.delete_all
    @iic.internal_members.delete_all
    @iic.external_members.delete_all
    params[:iic][:manager_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        @iic.managers << manager unless @iic.managers.include?(manager)
      end
    end
    params[:iic][:internal_member_ids].each do |member_id|
      unless member_id.empty?
        internal_member = User.find(member_id)
        @iic.internal_members << internal_member unless @iic.internal_members.include?(internal_member)
      end
    end
    params[:iic][:external_member_ids].each do |member_id|
      unless member_id.empty?
        external_member = Employee.find(member_id)
        @iic.external_members << external_member unless @iic.external_members.include?(external_member)
      end
    end
    @iic.managers.reload
    respond_to do |format|
      if @iic.update(iic_params)
        format.html { redirect_to @iic, notice: 'Iic was successfully updated.' }
        format.json { render :show, status: :ok, location: @iic }
        enter_log_message('Se editó la coordinación interinstitucional de nombre "' + @iic.name + '".', @iic.log_id, @iic.privacy)
      else
        format.html { render :edit }
        format.json { render json: @iic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iics/1
  # DELETE /iics/1.json
  def destroy
    @iic.destroy
    respond_to do |format|
      format.html { redirect_to iics_url, notice: 'Iic was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó la coordinación interinstitucional de nombre "' + @iic.name + '".', @iic.log_id, @iic.privacy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iic
      @iic = Iic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iic_params
      params.require(:iic).permit(:name, :description, :state, :start_date, :estimated_end_date, :end_date, :privacy, :multilateral, documents_attributes: [:name, :file, :version, :docType, :classification])
    end

    def get_privacy_levels
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
