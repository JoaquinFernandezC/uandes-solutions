class FeloniesController < ApplicationController
  before_action :set_felony, only: [:show, :edit, :update, :destroy]

  # GET /felonies
  # GET /felonies.json
  def index
    @felonies = Felony.all
  end

  # GET /felonies/1
  # GET /felonies/1.json
  def show
  end

  # GET /felonies/new
  def new
    @felony = Felony.new
  end

  # GET /felonies/1/edit
  def edit
  end

  # POST /felonies
  # POST /felonies.json
  def create
    @felony = Felony.new(felony_params)

    respond_to do |format|
      if @felony.save
        format.html { redirect_to felonies_path, notice: 'Felony was successfully created.' }
        format.json { render :show, status: :created, location: @felony }
      else
        format.html { render :new }
        format.json { render json: @felony.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /felonies/1
  # PATCH/PUT /felonies/1.json
  def update
    respond_to do |format|
      if @felony.update(felony_params)
        format.html { redirect_to @felony, notice: 'Felony was successfully updated.' }
        format.json { render :show, status: :ok, location: @felony }
      else
        format.html { render :edit }
        format.json { render json: @felony.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /felonies/1
  # DELETE /felonies/1.json
  def destroy
    @felony.destroy
    respond_to do |format|
      format.html { redirect_to felonies_url, notice: 'Felony was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_felony
      @felony = Felony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def felony_params
      params.require(:felony).permit(:name, :description)
    end
end
