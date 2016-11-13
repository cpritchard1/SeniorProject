json.extract! jobsite_contact, :id, :name, :phone, :email, :jobsite_id, :created_at, :updated_at
json.url jobsite_contact_url(jobsite_contact, format: :json)