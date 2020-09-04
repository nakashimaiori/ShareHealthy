class ChangeDataWeightToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :weight, :float
  end
end
