class CreateMycometerCocSamples < ActiveRecord::Migration
  def change
    create_table :mycometer_coc_samples do |t|
      t.string :sample_num
      t.string :location
      t.integer :bv1
      t.integer :bv2
      t.decimal :cv
      t.integer :av
      t.decimal :bsv
      t.string :result
      t.references :mycometer_coc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
