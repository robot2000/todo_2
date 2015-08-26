class AddColumnPriorityAndCompleteFromTask < ActiveRecord::Migration
  def change
    add_column :tasks, :complete, :boolean, null: false, default: false
    add_column :tasks, :priority, :integer, null: false, default: 0
  end
end
