class AddCompanyToFeeds < ActiveRecord::Migration[5.0]
  def change
    add_reference :feeds, :company, foreign_key: true
  end
end
