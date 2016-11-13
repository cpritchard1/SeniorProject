class CreateAllReports < ActiveRecord::Migration
  def change
    create_table :all_reports do |t|

      t.timestamps null: false
    end
  end
end
