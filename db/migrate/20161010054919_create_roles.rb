class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true

      t.boolean :view_task
      t.boolean :create_task
      t.boolean :update_task
      t.boolean :edit_task
      t.boolean :destroy_task

      t.boolean :view_note
      t.boolean :create_note
      t.boolean :update_note
      t.boolean :edit_note
      t.boolean :destroy_note


      t.timestamps
    end
  end
end
