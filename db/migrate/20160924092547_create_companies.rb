class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :email
      t.text :address
      t.text :contact
      t.integer :organization, index: true
      t.timestamps
    end
  end
end
