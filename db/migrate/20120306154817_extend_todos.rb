class ExtendTodos < ActiveRecord::Migration
  def up
  	add_column :todos, :user_id, :integer
    add_index :todos, [:user_id, :created_at]
  end

  def down
  	
  end
end
