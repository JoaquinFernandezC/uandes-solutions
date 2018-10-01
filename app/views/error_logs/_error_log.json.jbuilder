json.extract! error_log, :id, :code, :privacy, :action, :created_at, :updated_at
json.url error_log_url(error_log, format: :json)
