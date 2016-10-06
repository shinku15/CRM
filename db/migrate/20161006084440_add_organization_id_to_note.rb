class AddOrganizationIdToNote < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :organization, foreign_key: true
  end
end
