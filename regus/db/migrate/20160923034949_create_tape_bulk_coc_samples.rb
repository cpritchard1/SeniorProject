class CreateTapeBulkCocSamples < ActiveRecord::Migration
  def change
    create_table :tape_bulk_coc_samples do |t|
      t.string :sample_num
      t.string :location
      t.string :collection_type
      t.references :tape_bulk_coc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
