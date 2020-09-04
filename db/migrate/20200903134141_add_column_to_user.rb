class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :old, :integer
    add_column :users, :sex, :integer
    add_column :users, :status, :boolean,null: false, default: true
    add_column :users, :weight, :integer
    add_column :users, :tall, :integer
    add_column :users, :introduction, :text
    add_column :users, :profile_image_id, :string
    add_column :users, :target, :integer
  end
end
