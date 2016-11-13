class CreateSubcontractorContacts < ActiveRecord::Migration
  def change
    create_table :subcontractor_contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      # t.references :subcontractor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
