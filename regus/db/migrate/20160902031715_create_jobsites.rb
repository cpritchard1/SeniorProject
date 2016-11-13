class CreateJobsites < ActiveRecord::Migration
  def change
    create_table :jobsites do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :full_address
      t.float  :latitude
      t.float  :longitude


      t.timestamps null: false
    end
  end
end
