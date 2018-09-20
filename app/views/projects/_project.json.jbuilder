json.extract! project, :id, :year, :project_number, :name, :objective, :state, :start_date, :estimated_end_date, :end_date, :privacy, :log, :created_at, :updated_at
json.url project_url(project, format: :json)
