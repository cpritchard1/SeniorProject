json.extract! subcontractor_contact, :id, :name, :phone, :email, :subcontractor_id, :created_at, :updated_at
json.url subcontractor_contact_url(subcontractor_contact, format: :json)