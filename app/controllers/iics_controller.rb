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
    @iic = Iic.new(iic_params)
    respond_to do |format|
      if @iic.save
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
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iic_params
      params.require(:iic).permit(:name, :description, :state, :start_date, :estimated_end_date, :end_date, :log, :privacy, :multilateral)
    end
end
