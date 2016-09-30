class AddColumnIsCompletedAndCompletedOnAndCompletedByToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :is_completed, :boolean, default: false
    add_column :tasks, :completed_at, :date
    add_column :tasks, :completed_by, :integer
  end
end
