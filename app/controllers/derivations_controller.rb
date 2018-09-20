class DerivationsController < ApplicationController
  before_action :set_derivation, only: [:show, :edit, :update, :destroy]

  # GET /derivations
  # GET /derivations.json
  def index
    @derivations = Derivation.all
  end

  # GET /derivations/1
  # GET /derivations/1.json
  def show
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

    respond_to do |format|
      if @derivation.save
        format.html { redirect_to @derivation, notice: 'Derivation was successfully created.' }
        format.json { render :show, status: :created, location: @derivation }
      else
        format.html { render :new }
        format.json { render json: @derivation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derivations/1
  # PATCH/PUT /derivations/1.json
  def update
    respond_to do |format|
      if @derivation.update(derivation_params)
        format.html { redirect_to @derivation, notice: 'Derivation was successfully updated.' }
        format.json { render :show, status: :ok, location: @derivation }
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
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derivation
      @derivation = Derivation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derivation_params
      params.require(:derivation).permit(:name, :description, :petitioner_id, :state, :priority, :derivation_date, :work_start_date, :estimated_work_start_date, :estimated_end_date, :end_date, :log, :privacy)
    end
end
