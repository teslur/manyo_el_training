class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :priority, null: false
      t.integer :status, null: false, limit: 1, default: 0
      t.string :name, null: false
      t.text :description
      t.datetime :limit_date

      t.timestamps
    end
    add_index :tasks, :priority
    add_index :tasks, :status
    add_index :tasks, :limit_date
  end
end
