class CreateJobsiteContacts < ActiveRecord::Migration
  def change
    create_table :jobsite_contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      # t.references :jobsite, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
