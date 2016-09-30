class AddColumnAssignToToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :assign_to, :integer
  end
end
