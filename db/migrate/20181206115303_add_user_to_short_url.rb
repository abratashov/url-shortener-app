class AddUserToShortUrl < ActiveRecord::Migration[5.2]
  def change
    add_reference :short_urls, :user, foreign_key: true
  end
end
