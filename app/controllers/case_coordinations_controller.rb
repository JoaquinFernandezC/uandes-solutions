class CaseCoordinationsController < ApplicationController
  before_action :set_case_coordination, only: [:show, :edit, :update, :destroy]

  # GET /case_coordinations
  # GET /case_coordinations.json
  def index
    @case_coordinations = CaseCoordination.all
  end

  # GET /case_coordinations/1
  # GET /case_coordinations/1.json
  def show
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

    respond_to do |format|
      if @case_coordination.save
        format.html { redirect_to @case_coordination, notice: 'Case coordination was successfully created.' }
        format.json { render :show, status: :created, location: @case_coordination }
      else
        format.html { render :new }
        format.json { render json: @case_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /case_coordinations/1
  # PATCH/PUT /case_coordinations/1.json
  def update
    respond_to do |format|
      if @case_coordination.update(case_coordination_params)
        format.html { redirect_to @case_coordination, notice: 'Case coordination was successfully updated.' }
        format.json { render :show, status: :ok, location: @case_coordination }
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
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case_coordination
      @case_coordination = CaseCoordination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_coordination_params
      params.require(:case_coordination).permit(:name, :description, :state, :estimated_end_date, :log, :privacy)
    end
end
