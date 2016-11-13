class CreateSporeTypeCounts < ActiveRecord::Migration
  def change
    create_table :spore_type_counts do |t|
      t.string :agrocybe
      t.string :alternaria
      t.string :ascospores
      t.string :aspergillus
      t.string :aureobasidium
      t.string :basidiospores
      t.string :bipolaris
      t.string :botrytis
      t.string :chaetomium
      t.string :cercospora
      t.string :cladosporium
      t.string :curvularia
      t.string :epicoccum
      t.string :fusarium
      t.string :myxomycetes
      t.string :nigrospora
      t.string :oidium
      t.string :pithomyces
      t.string :pollen
      t.string :rust
      t.string :spegazzina
      t.string :stachybotrys
      t.string :torula
      t.string :tetraploa
      t.string :ulocladium
      t.string :unidentifiable
      t.string :fibrous
      t.string :hyphal
      t.string :insect
      t.references :tape_bulk_coc_sample, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
