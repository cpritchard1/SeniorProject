json.extract! company, :id, :name, :phone, :street, :city, :state, :zip, :email, :website, :created_at, :updated_at
json.url company_url(company, format: :json)