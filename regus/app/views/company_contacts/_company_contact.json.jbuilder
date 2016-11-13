json.extract! company_contact, :id, :name, :phone, :email, :company_id, :created_at, :updated_at
json.url company_contact_url(company_contact, format: :json)