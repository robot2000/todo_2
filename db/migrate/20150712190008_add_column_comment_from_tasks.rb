class AddColumnCommentFromTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :comment, :string
  end
end
