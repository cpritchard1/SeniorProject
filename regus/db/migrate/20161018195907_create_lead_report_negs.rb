class CreateLeadReportNegs < ActiveRecord::Migration
  def change
    create_table :lead_report_negs do |t|
      t.datetime :date
      t.string :company
      t.string :contact
      t.string :address
      t.string :service
      t.string :instrument
      t.string :jobsite_name
      t.string :jobsite_addr
      t.string :consultant
      t.string :purpose
      t.string :analytics
      t.string :results
      t.string :assumptions
      t.string :cac
      t.string :cdph
      t.string :nv
      t.references :xrf_coc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
