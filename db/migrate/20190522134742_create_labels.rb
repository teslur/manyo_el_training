class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.bigint :task_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :labels, :task_id
  end
end
