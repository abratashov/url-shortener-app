class CreateRedirections < ActiveRecord::Migration[5.2]
  def change
    create_table :redirections do |t|
      t.references :short_url, foreign_key: true
      t.json :user_info, default: {}

      t.timestamps
    end
  end
end
