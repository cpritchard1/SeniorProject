class CreateMycometerCocs < ActiveRecord::Migration
  def change
    create_table :mycometer_cocs do |t|
      t.datetime :date
      t.string :turnaround
      t.string :mold_air
      t.string :building_type
      t.string :sampling_method
      t.string :test_unit
      t.integer :ambient_temp
      t.string :reaction_time
      t.integer :liters_minute
      t.string :duration
      t.string :job_type
      t.string :cli_type
      t.references :job, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
