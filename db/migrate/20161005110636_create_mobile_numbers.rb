class CreateMobileNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :mobile_numbers do |t|
      t.integer :number
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
