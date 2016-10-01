class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :email
      t.text :address
      t.text :contact
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
