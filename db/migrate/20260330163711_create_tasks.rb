class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status
      t.references :project, null: false, foreign_key: true
      t.references :assigned_to, polymorphic: true, null: false

      t.timestamps
    end
  end
end
