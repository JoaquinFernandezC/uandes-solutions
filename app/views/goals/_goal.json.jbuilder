json.extract! goal, :id, :year, :goal_number, :name, :description, :state, :estimated_end_date, :end_date, :privacy, :log, :created_at, :updated_at
json.url goal_url(goal, format: :json)
