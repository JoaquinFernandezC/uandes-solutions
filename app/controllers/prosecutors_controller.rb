class ProsecutorsController < ApplicationController
  before_action :set_prosecutor, only: [:show, :edit, :update, :destroy]

  # GET /prosecutors
  # GET /prosecutors.json
  def index
    @prosecutors = Prosecutor.all
  end

  # GET /prosecutors/1
  # GET /prosecutors/1.json
  def show
  end

  # GET /prosecutors/new
  def new
    @prosecutor = Prosecutor.new
  end

  # GET /prosecutors/1/edit
  def edit
  end

  # POST /prosecutors
  # POST /prosecutors.json
  def create
    @prosecutor = Prosecutor.new(prosecutor_params)

    respond_to do |format|
      if @prosecutor.save
        format.html { redirect_to entity_selection_index_path, notice: 'Prosecutor was successfully created.' }
        format.json { render :show, status: :created, location: @prosecutor }
      else
        format.html { render :new }
        format.json { render json: @prosecutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prosecutors/1
  # PATCH/PUT /prosecutors/1.json
  def update
    respond_to do |format|
      if @prosecutor.update(prosecutor_params)
        format.html { redirect_to entity_selection_index_path, notice: 'Prosecutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @prosecutor }
      else
        format.html { render :edit }
        format.json { render json: @prosecutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prosecutors/1
  # DELETE /prosecutors/1.json
  def destroy
    @prosecutor.destroy
    respond_to do |format|
      format.html { redirect_to prosecutors_url, notice: 'Prosecutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prosecutor
      @prosecutor = Prosecutor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prosecutor_params
      params.require(:prosecutor).permit(:name, :rut, :local_office)
    end
end
