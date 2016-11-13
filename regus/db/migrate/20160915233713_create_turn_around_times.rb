class CreateTurnAroundTimes < ActiveRecord::Migration
  def change
    create_table :turn_around_times do |t|
      t.string :turntime

      t.timestamps null: false
    end
  end
end
