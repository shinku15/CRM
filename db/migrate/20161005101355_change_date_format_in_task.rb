class ChangeDateFormatInTask < ActiveRecord::Migration[5.0]
  def up
   change_column :tasks, :completed_on, :datetime
 end

 def down
   change_column :tasks, :completed_on, :date
 end
end
