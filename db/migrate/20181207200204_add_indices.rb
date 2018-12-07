class AddIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :short_urls, :short_link, unique: true
    add_index :short_urls, [:short_link, :user_id], unique: true
  end
end
