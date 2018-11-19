class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    @filtered = false
    filter = params[:filter]

    if !filter.nil?
      document_name = filter[:name]
      if !document_name.nil? && document_name != ""
        @filtered = true
        document_name = document_name.strip()
        @documents = @documents.where("name LIKE '%#{document_name}'")
      end
      puts "document name: #{document_name}"
      document_classification = filter[:classification]
      if !document_classification.nil? && document_classification != ""
        @filtered = true
        document_classification = document_classification.strip()
        @documents = @documents.where("classification LIKE '%#{document_classification}'")
      end
      puts "document classification: #{document_classification}"
      document_type = filter[:docType]
      if !document_type.nil? && document_type != ""
        @filtered = true
        document_type = document_type.strip()
        @documents = @documents.where("docType LIKE '#{document_type}'")
      end
      puts "document type: #{document_type}"
    else
      @documents = Document.all
    end
    @filter = if filter.nil? then nil else OpenStruct.new(filter) end
    puts(@filter)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @log = Log.find(@document.log_id)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        log = Log.new
        log.save
        @document.update(log_id: log.id)
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :version, :classification, :docType, :log_id, :file)
    end
end
