class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :content
      t.datetime :due_date
      t.boolean :complete
      t.string :icon
      t.integer :fileset_id

      t.timestamps
    end
  end
end
