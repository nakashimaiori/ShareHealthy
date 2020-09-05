class CreateDayWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :day_weights do |t|
      t.integer :user_id, null: false
      t.float :weight, null: false
      t.date :start_time, null: false

      t.timestamps
    end
  end
end
