class CaseCoordinationsController < ApplicationController
  before_action :set_case_coordination, only: [:show, :edit, :update, :destroy]
  before_action :get_privacy_levels

  # GET /case_coordinations
  # GET /case_coordinations.json
  def index
    @case_coordinations = CaseCoordination.all
    #@case_coordinations = Adapters::CcPrivacyFilter.get_cc(current_user)
  end

  # GET /case_coordinations/1
  # GET /case_coordinations/1.json
  def show
    @log = Log.find(@case_coordination.log_id)
    enter_log_message('Se accedió a la coordinación de caso de nombre "' + @case_coordination.name + '".', @case_coordination.log_id, @case_coordination.privacy)
  end

  # GET /case_coordinations/new
  def new
    @case_coordination = CaseCoordination.new
  end

  # GET /case_coordinations/1/edit
  def edit
  end

  # POST /case_coordinations
  # POST /case_coordinations.json
  def create
    @case_coordination = CaseCoordination.new(case_coordination_params)
    params[:case_coordination][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @case_coordination.users << manager unless @case_coordination.users.include?(manager)
        end
      end
    end
    params[:case_coordination][:ruc_ids].each do |ruc_id|
      unless ruc_id.empty?
        ruc = Ruc.find(ruc_id)
        unless ruc.nil?
          @case_coordination.rucs << ruc unless @case_coordination.rucs.include?(ruc)
        end
      end
    end
    params[:case_coordination][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @case_coordination.people << person unless @case_coordination.people.include?(person)
        end
      end
    end
    params[:case_coordination][:legal_person_ids].each do |legal_person_id|
      unless legal_person_id.empty?
        legal_person = LegalPerson.find(legal_person_id)
        unless legal_person.nil?
          @case_coordination.legal_people << legal_person unless @case_coordination.legal_people.include?(legal_person)
        end
      end
    end
    params[:case_coordination][:prosecutor_ids].each do |prosecutor_id|
      unless prosecutor_id.empty?
        prosecutor = Prosecutor.find(prosecutor_id)
        unless prosecutor.nil?
          @case_coordination.prosecutors << prosecutor unless @case_coordination.prosecutors.include?(prosecutor)
        end
      end
    end
    params[:case_coordination][:regional_pros_office_ids].each do |office_id|
      unless office_id.empty?
        office = RegionalProsOffice.find(office_id)
        unless office.nil?
          @case_coordination.regional_pros_offices << office unless @case_coordination.regional_pros_offices.include?(office)
        end
      end
    end
    respond_to do |format|
      if @case_coordination.save
        log = Log.new
        log.save
        @case_coordination.update(log_id: log.id)
        format.html { redirect_to @case_coordination, notice: 'Case coordination was successfully created.' }
        format.json { render :show, status: :created, location: @case_coordination }
        enter_log_message('Se creó una nueva coordinación de caso con nombre "' + @case_coordination.name + '".', @case_coordination.log_id, @case_coordination.privacy)
      else
        format.html { render :new }
        format.json { render json: @case_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_coordinations/1
  # PATCH/PUT /case_coordinations/1.json
  def update
    @case_coordination.users.delete_all
    params[:case_coordination][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @case_coordination.users << manager unless @case_coordination.users.include?(manager)
        end
      end
    end
    @case_coordination.rucs.delete_all
    params[:case_coordination][:ruc_ids].each do |ruc_id|
      unless ruc_id.empty?
        ruc = Ruc.find(ruc_id)
        unless ruc.nil?
          @case_coordination.rucs << ruc unless @case_coordination.rucs.include?(ruc)
        end
      end
    end
    @case_coordination.people.delete_all
    params[:case_coordination][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @case_coordination.people << person unless @case_coordination.people.include?(person)
        end
      end
    end
    @case_coordination.legal_people.delete_all
    params[:case_coordination][:legal_person_ids].each do |legal_person_id|
      unless legal_person_id.empty?
        legal_person = LegalPerson.find(legal_person_id)
        unless legal_person.nil?
          @case_coordination.legal_people << legal_person unless @case_coordination.legal_people.include?(legal_person)
        end
      end
    end
    @case_coordination.prosecutors.delete_all
    params[:case_coordination][:prosecutor_ids].each do |prosecutor_id|
      unless prosecutor_id.empty?
        prosecutor = Prosecutor.find(prosecutor_id)
        unless prosecutor.nil?
          @case_coordination.prosecutors << prosecutor unless @case_coordination.prosecutors.include?(prosecutor)
        end
      end
    end
    @case_coordination.regional_pros_offices.delete_all
    params[:case_coordination][:regional_pros_office_ids].each do |office_id|
      unless office_id.empty?
        office = RegionalProsOffice.find(office_id)
        unless office.nil?
          @case_coordination.regional_pros_offices << office unless @case_coordination.regional_pros_offices.include?(office)
        end
      end
    end
    respond_to do |format|
      if @case_coordination.update(case_coordination_params)
        format.html { redirect_to @case_coordination, notice: 'Case coordination was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_coordination }
        enter_log_message('Se editó la coordinación de casos de nombre "' + @case_coordination.name + '".', @case_coordination.log_id, @case_coordination.privacy)
      else
        format.html { render :edit }
        format.json { render json: @case_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_coordinations/1
  # DELETE /case_coordinations/1.json
  def destroy
    @case_coordination.destroy
    respond_to do |format|
      format.html { redirect_to case_coordinations_url, notice: 'Case coordination was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó la coordinación de casos de nombre "' + @case_coordination.name + '".', @case_coordination.log_id, @case_coordination.privacy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_coordination
      @case_coordination = CaseCoordination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_coordination_params
      params.require(:case_coordination).permit(:name, :description, :state, :estimated_end_date, :end_date, :privacy)
    end

    def get_privacy_levels
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
