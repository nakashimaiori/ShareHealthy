class ChangeDataTargetToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :target, :float
  end
end
