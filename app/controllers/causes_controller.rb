class CausesController < ApplicationController
  before_action :set_cause, only: [:show, :edit, :update, :destroy]
  before_action :get_privacy_levels
  
  # GET /causes
  # GET /causes.json
  def index
    @causes = Adapters::CausePrivacyFilter.get_causes(current_user)
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
    @log = Log.find(@cause.log_id)
    enter_log_message('Se accedió al caso de nombre "' + @cause.name + '".', @cause.log_id, @cause.privacy)
  end

  # GET /causes/new
  def new
    @cause = Cause.new
  end

  # GET /causes/1/edit
  def edit
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new(cause_params)
    params[:cause][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @cause.users << manager unless @cause.users.include?(manager)
        end
      end
    end
    params[:cause][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @cause.people << person unless @cause.people.include?(person)
        end
      end
    end
    params[:cause][:legal_person_ids].each do |legal_person_id|
      unless legal_person_id.empty?
        legal_person = LegalPerson.find(legal_person_id)
        unless legal_person.nil?
          @cause.legal_people << legal_person unless @cause.legal_people.include?(legal_person)
        end
      end
    end
    respond_to do |format|
      if @cause.save
        log = Log.new
        log.save
        @cause.update(log_id: log.id)
        format.html { redirect_to @cause, notice: 'Cause was successfully created.' }
        format.json { render :show, status: :created, location: @cause }
        enter_log_message('Se creó un nuevo caso con nombre "' + @cause.name + '".', @cause.log_id, @cause.privacy)
      else
        format.html { render :new }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /causes/1
  # PATCH/PUT /causes/1.json
  def update
    @cause.users.delete_all
    params[:cause][:user_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @cause.users << manager unless @cause.users.include?(manager)
        end
      end
    end
    @cause.people.delete_all
    params[:cause][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @cause.people << person unless @cause.people.include?(person)
        end
      end
    end
    @cause.legal_people.delete_all
    params[:cause][:legal_person_ids].each do |legal_person_id|
      unless legal_person_id.empty?
        legal_person = LegalPerson.find(legal_person_id)
        unless legal_person.nil?
          @cause.legal_people << legal_person unless @cause.legal_people.include?(legal_person)
        end
      end
    end
    respond_to do |format|
      if @cause.update(cause_params)
        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { render :show, status: :ok, location: @cause }
        enter_log_message('Se editó el caso de nombre "' + @cause.name + '".', @cause.log_id, @cause.privacy)
      else
        format.html { render :edit }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause.destroy
    respond_to do |format|
      format.html { redirect_to causes_url, notice: 'Cause was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó el caso de nombre "' + @cause.name + '".', @cause.log_id, @cause.privacy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
      @cause = Cause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cause_params
      params.require(:cause).permit(:name, :regional_pros_office_id, :description, :privacy, :ruc_id, :state, :prosecutor_id, :estimated_end_date, :end_date)
    end

    def get_privacy_levels
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
