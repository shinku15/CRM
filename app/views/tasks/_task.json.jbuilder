json.extract! task, :id, :description, :company_id, :completed_on, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)