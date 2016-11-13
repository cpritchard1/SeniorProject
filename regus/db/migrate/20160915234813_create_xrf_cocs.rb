class CreateXrfCocs < ActiveRecord::Migration
  def change
    create_table :xrf_cocs do |t|
      t.datetime :date
      t.string :turnaround
      t.string :xrfunit
      t.string :xrfmode
      t.string :actionlevel
      t.string :abatementlevel
      t.string :job_type
      t.string :cli_type
      t.references :job, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
