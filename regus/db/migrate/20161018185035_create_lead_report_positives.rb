class CreateLeadReportPositives < ActiveRecord::Migration
  def change
    create_table :lead_report_positives do |t|
      t.string :purpose
      t.string :analytics
      t.string :results
      t.string :recommendations
      t.string :assumptions

      t.timestamps null: false
    end
  end
end
