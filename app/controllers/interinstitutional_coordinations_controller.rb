class InterinstitutionalCoordinationsController < ApplicationController
  before_action :set_interinstitutional_coordination, only: [:show, :edit, :update, :destroy]

  # GET /interinstitutional_coordinations
  # GET /interinstitutional_coordinations.json
  def index
    @interinstitutional_coordinations = InterinstitutionalCoordination.all
  end

  # GET /interinstitutional_coordinations/1
  # GET /interinstitutional_coordinations/1.json
  def show
  end

  # GET /interinstitutional_coordinations/new
  def new
    @interinstitutional_coordination = InterinstitutionalCoordination.new
  end

  # GET /interinstitutional_coordinations/1/edit
  def edit
  end

  # POST /interinstitutional_coordinations
  # POST /interinstitutional_coordinations.json
  def create
    @interinstitutional_coordination = InterinstitutionalCoordination.new(interinstitutional_coordination_params)

    respond_to do |format|
      if @interinstitutional_coordination.save
        format.html { redirect_to @interinstitutional_coordination, notice: 'Interinstitutional coordination was successfully created.' }
        format.json { render :show, status: :created, location: @interinstitutional_coordination }
      else
        format.html { render :new }
        format.json { render json: @interinstitutional_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interinstitutional_coordinations/1
  # PATCH/PUT /interinstitutional_coordinations/1.json
  def update
    respond_to do |format|
      if @interinstitutional_coordination.update(interinstitutional_coordination_params)
        format.html { redirect_to @interinstitutional_coordination, notice: 'Interinstitutional coordination was successfully updated.' }
        format.json { render :show, status: :ok, location: @interinstitutional_coordination }
      else
        format.html { render :edit }
        format.json { render json: @interinstitutional_coordination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interinstitutional_coordinations/1
  # DELETE /interinstitutional_coordinations/1.json
  def destroy
    @interinstitutional_coordination.destroy
    respond_to do |format|
      format.html { redirect_to interinstitutional_coordinations_url, notice: 'Interinstitutional coordination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interinstitutional_coordination
      @interinstitutional_coordination = InterinstitutionalCoordination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interinstitutional_coordination_params
      params.require(:interinstitutional_coordination).permit(:name, :description, :state, :start_date, :estimated_end_date, :end_date, :log, :privacy, :multilateral)
    end
end
