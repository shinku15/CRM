json.extract! note, :id, :description, :company_id, :user_id, :created_at, :updated_at
json.url note_url(note, format: :json)