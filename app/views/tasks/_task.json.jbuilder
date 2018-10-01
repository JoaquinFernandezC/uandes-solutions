json.extract! task, :id, :name, :description, :user_id, :start_date, :estimated_end_date, :end_date, :privacy, :priority, :state, :needs_checking, :log, :created_at, :updated_at
json.url task_url(task, format: :json)
