class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.references :subcontractor, index: true, foreign_key: true
      t.references :jobsite, index: true, foreign_key: true

      t.references :company_contact, index: true, foreign_key: true
      t.references :subcontractor_contact, index: true, foreign_key: true
      t.references :jobsite_contact, inded: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
