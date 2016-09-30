class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.integer :feedable_id
      t.string :feedable_type
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
