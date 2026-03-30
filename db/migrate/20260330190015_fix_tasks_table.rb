class FixTasksTable < ActiveRecord::Migration[8.1]
  def change
    remove_column :tasks, :assigned_to_id
    remove_column :tasks, :assigned_to_type
    add_column :tasks, :user_id, :integer
    add_index :tasks, :user_id
  end
end