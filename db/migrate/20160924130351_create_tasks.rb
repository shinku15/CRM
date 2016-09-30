class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.references :company, foreign_key: true
      t.date :completed_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
