json.extract! document, :id, :name, :version, :classification, :type, :log, :created_at, :updated_at
json.url document_url(document, format: :json)
