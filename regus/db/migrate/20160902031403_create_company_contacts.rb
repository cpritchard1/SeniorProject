class CreateCompanyContacts < ActiveRecord::Migration
  def change
    create_table :company_contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      # t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
