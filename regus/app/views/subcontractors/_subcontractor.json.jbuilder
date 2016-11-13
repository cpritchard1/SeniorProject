json.extract! subcontractor, :id, :name, :phone, :street, :city, :state, :zip, :email, :website, :created_at, :updated_at
json.url subcontractor_url(subcontractor, format: :json)