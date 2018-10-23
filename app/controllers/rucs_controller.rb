class RucsController < ApplicationController
  before_action :set_ruc, only: [:show, :edit, :update, :destroy]

  # GET /rucs
  # GET /rucs.json
  def index
    @rucs = Ruc.all
  end

  # GET /rucs/1
  # GET /rucs/1.json
  def show
  end

  # GET /rucs/new
  def new
    @ruc = Ruc.new
  end

  # GET /rucs/1/edit
  def edit
  end

  # POST /rucs
  # POST /rucs.json
  def create
    @ruc = Ruc.new(ruc_params)

    respond_to do |format|
      if @ruc.save
        format.html { redirect_to entity_selection_index_path, notice: 'Ruc was successfully created.' }
        format.json { render :show, status: :created, location: @ruc }
      else
        format.html { render :new }
        format.json { render json: @ruc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rucs/1
  # PATCH/PUT /rucs/1.json
  def update
    respond_to do |format|
      if @ruc.update(ruc_params)
        format.html { redirect_to entity_selection_index_path, notice: 'Ruc was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruc }
      else
        format.html { render :edit }
        format.json { render json: @ruc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rucs/1
  # DELETE /rucs/1.json
  def destroy
    @ruc.destroy
    respond_to do |format|
      format.html { redirect_to rucs_url, notice: 'Ruc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruc
      @ruc = Ruc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruc_params
      params.require(:ruc).permit(:number)
    end
end
