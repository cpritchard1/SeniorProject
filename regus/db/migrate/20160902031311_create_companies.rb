class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :website

      t.timestamps null: false
    end
  end
end
