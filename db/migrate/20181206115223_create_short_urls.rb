class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.string :link
      t.string :short_link

      t.timestamps
    end
  end
end
