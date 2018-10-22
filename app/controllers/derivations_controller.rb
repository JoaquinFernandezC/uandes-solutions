class DerivationsController < ApplicationController
  before_action :set_derivation, only: [:show, :edit, :update, :destroy]
  before_action :get_privacy_levels

  # GET /derivations
  # GET /derivations.json
  def index
    @derivations = Derivation.all
  end

  # GET /derivations/1
  # GET /derivations/1.json
  def show
    @log = Log.find(@derivation.log_id)
    enter_log_message('Se accedió a la derivación de nombre "' + @derivation.name + '".', @derivation.log_id, @derivation.privacy)
  end

  # GET /derivations/new
  def new
    @derivation = Derivation.new
  end

  # GET /derivations/1/edit
  def edit
  end

  # POST /derivations
  # POST /derivations.json
  def create
    @derivation = Derivation.new(derivation_params)
    params[:derivation][:manager_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @derivation.managers << manager unless @derivation.managers.include?(manager)
        end
      end
    end
    params[:derivation][:report_receiver_ids].each do |receiver_id|
      unless receiver_id.empty?
        receiver = User.find(receiver_id)
        unless receiver.nil?
          @derivation.report_receivers << receiver unless @derivation.report_receivers.include?(receiver)
        end
      end
    end
    params[:derivation][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @derivation.people << person unless @derivation.people.include?(person)
        end
      end
    end
    respond_to do |format|
      if @derivation.save
        log = Log.new
        log.save
        @derivation.update(log_id: log.id)
        format.html { redirect_to @derivation, notice: 'Derivation was successfully created.' }
        format.json { render :show, status: :created, location: @derivation }
        enter_log_message('Se creó una nueva derivación con nombre "' + @derivation.name + '".', @derivation.log_id, @derivation.privacy)
      else
        format.html { render :new }
        format.json { render json: @derivation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derivations/1
  # PATCH/PUT /derivations/1.json
  def update
    @derivation.managers.delete_all
    params[:derivation][:manager_ids].each do |manager_id|
      unless manager_id.empty?
        manager = User.find(manager_id)
        unless manager.nil?
          @derivation.managers << manager unless @derivation.managers.include?(manager)
        end
      end
    end
    @derivation.report_receivers.delete_all
    params[:derivation][:report_receiver_ids].each do |receiver_id|
      unless receiver_id.empty?
        receiver = User.find(receiver_id)
        unless receiver.nil?
          @derivation.report_receivers << receiver unless @derivation.report_receivers.include?(receiver)
        end
      end
    end
    @derivation.people.delete_all
    params[:derivation][:person_ids].each do |person_id|
      unless person_id.empty?
        person = Person.find(person_id)
        unless person.nil?
          @derivation.people << person unless @derivation.people.include?(person)
        end
      end
    end
    respond_to do |format|
      if @derivation.update(derivation_params)
        format.html { redirect_to @derivation, notice: 'Derivation was successfully updated.' }
        format.json { render :show, status: :ok, location: @derivation }
        enter_log_message('Se editó la derivación de nombre "' + @derivation.name + '".', @derivation.log_id, @derivation.privacy)
      else
        format.html { render :edit }
        format.json { render json: @derivation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derivations/1
  # DELETE /derivations/1.json
  def destroy
    @derivation.destroy
    respond_to do |format|
      format.html { redirect_to derivations_url, notice: 'Derivation was successfully destroyed.' }
      format.json { head :no_content }
      enter_log_message('Se eliminó la derivación de nombre "' + @derivation.name + '".', @derivation.log_id, @derivation.privacy)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derivation
      @derivation = Derivation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derivation_params
      params.require(:derivation).permit(:name, :description, :petitioner_id, :state, :priority, :derivation_date, :work_start_date, :estimated_work_start_date, :estimated_end_date, :end_date, :privacy)
    end

    def get_privacy_levels
      @privacy_levels = PrivacyLevel.all.pluck(:tag)
      @status = Status.all.pluck(:tag)
    end
end
