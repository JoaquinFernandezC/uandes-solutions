class RegionalProsOfficesController < ApplicationController
  before_action :set_regional_pros_office, only: [:show, :edit, :update, :destroy]

  # GET /regional_pros_offices
  # GET /regional_pros_offices.json
  def index
    @regional_pros_offices = RegionalProsOffice.all
  end

  # GET /regional_pros_offices/1
  # GET /regional_pros_offices/1.json
  def show
  end

  # GET /regional_pros_offices/new
  def new
    @regional_pros_office = RegionalProsOffice.new
  end

  # GET /regional_pros_offices/1/edit
  def edit
  end

  # POST /regional_pros_offices
  # POST /regional_pros_offices.json
  def create
    @regional_pros_office = RegionalProsOffice.new(regional_pros_office_params)

    respond_to do |format|
      if @regional_pros_office.save
        format.html { redirect_to @regional_pros_office, notice: 'Regional pros office was successfully created.' }
        format.json { render :show, status: :created, location: @regional_pros_office }
      else
        format.html { render :new }
        format.json { render json: @regional_pros_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regional_pros_offices/1
  # PATCH/PUT /regional_pros_offices/1.json
  def update
    respond_to do |format|
      if @regional_pros_office.update(regional_pros_office_params)
        format.html { redirect_to @regional_pros_office, notice: 'Regional pros office was successfully updated.' }
        format.json { render :show, status: :ok, location: @regional_pros_office }
      else
        format.html { render :edit }
        format.json { render json: @regional_pros_office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regional_pros_offices/1
  # DELETE /regional_pros_offices/1.json
  def destroy
    @regional_pros_office.destroy
    respond_to do |format|
      format.html { redirect_to regional_pros_offices_url, notice: 'Regional pros office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regional_pros_office
      @regional_pros_office = RegionalProsOffice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regional_pros_office_params
      params.fetch(:regional_pros_office, {})
    end
end
