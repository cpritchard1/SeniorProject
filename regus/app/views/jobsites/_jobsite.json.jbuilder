json.extract! jobsite, :id, :name, :street, :city, :state, :zip, :created_at, :updated_at
json.url jobsite_url(jobsite, format: :json)