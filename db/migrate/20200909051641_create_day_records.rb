class CreateDayRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :day_records do |t|
      t.integer :user_id, null: false
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :snack
      t.integer :training
      t.text :memo
      t.date :start_time, null: false

      t.timestamps
    end
  end
end
