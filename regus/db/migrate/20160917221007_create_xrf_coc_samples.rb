class CreateXrfCocSamples < ActiveRecord::Migration
  def change
    create_table :xrf_coc_samples do |t|
      t.string :sample_num
      t.string :location
      t.string :material
      t.string :color
      t.string :condition
      t.string :reading
      t.string :category
      t.references :xrf_coc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
