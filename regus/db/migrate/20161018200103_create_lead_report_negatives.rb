class CreateLeadReportNegatives < ActiveRecord::Migration
  def change
    create_table :lead_report_negatives do |t|
      t.string :purpose
      t.string :analytics
      t.string :results
      t.string :assumptions

      t.timestamps null: false
    end
  end
end
