class IicsController < ApplicationController
  before_action :set_iic, only: [:show, :edit, :update, :destroy]

  # GET /iics
  # GET /iics.json
  def index
    @iics = Iic.all
  end

  # GET /iics/1
  # GET /iics/1.json
  def show
  end

  # GET /iics/new
  def new
    @iic = Iic.new
    @privacy_levels = ['Público', 'Privado', 'Secreto']
  end

  # GET /iics/1/edit
  def edit
  end

  # POST /iics
  # POST /iics.json
  def create
    @privacy_levels = ['Público', 'Privado', 'Secreto']
    @iic = Iic.new(iic_params)
    @iic.state = 'Open'
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
    params[:iic][:manager_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        @iic.managers << manager unless @iic.managers.include?(manager)
      end
    end
    @iic.internal_members.delete_all
    params[:iic][:internal_member_ids].each do |member_id|
      unless member_id.empty?
        internal_member = User.find(member_id)
        @iic.internal_members << internal_member unless @iic.internal_members.include?(internal_member)
      end
    end
    @iic.external_members.delete_all
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
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iic
      @iic = Iic.find(params[:id])
      @privacy_levels = ['Público', 'Privado', 'Secreto']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iic_params
      params.require(:iic).permit(:name, :description, :state, :start_date, :estimated_end_date, :end_date, :privacy, :multilateral)
    end
end
