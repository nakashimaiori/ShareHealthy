class ChangeTrainingOfDayRecords < ActiveRecord::Migration[5.2]
  def up
    change_column :day_records, :training, :integer, default: 0
  end

  def down
    change_column :day_records, :training, :integer
  end
end
