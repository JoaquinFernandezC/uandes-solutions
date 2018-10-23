class LegalPeopleController < ApplicationController
  before_action :set_legal_person, only: [:show, :edit, :update, :destroy]

  # GET /legal_people
  # GET /legal_people.json
  def index
    @legal_people = LegalPerson.all
  end

  # GET /legal_people/1
  # GET /legal_people/1.json
  def show
  end

  # GET /legal_people/new
  def new
    @legal_person = LegalPerson.new
  end

  # GET /legal_people/1/edit
  def edit
  end

  # POST /legal_people
  # POST /legal_people.json
  def create
    @legal_person = LegalPerson.new(legal_person_params)

    respond_to do |format|
      if @legal_person.save
        format.html { redirect_to legal_people_path, notice: 'Legal person was successfully created.' }
        format.json { render :show, status: :created, location: @legal_person }
      else
        format.html { render :new }
        format.json { render json: @legal_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_people/1
  # PATCH/PUT /legal_people/1.json
  def update
    respond_to do |format|
      if @legal_person.update(legal_person_params)
        format.html { redirect_to legal_people_path, notice: 'Legal person was successfully updated.' }
        format.json { render :show, status: :ok, location: @legal_person }
      else
        format.html { render :edit }
        format.json { render json: @legal_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_people/1
  # DELETE /legal_people/1.json
  def destroy
    @legal_person.destroy
    respond_to do |format|
      format.html { redirect_to legal_people_url, notice: 'Legal person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_person
      @legal_person = LegalPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_person_params
      params.require(:legal_person).permit(:name, :rut)
    end
end
