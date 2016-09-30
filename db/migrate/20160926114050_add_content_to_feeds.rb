class AddContentToFeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :feeds, :content, :text
  end
end
