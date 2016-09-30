class RenameOgranizationIdToOrganizationId < ActiveRecord::Migration[5.0]
  def change
    rename_column :companies, :ogranization_id, :organization_id
  end
end
