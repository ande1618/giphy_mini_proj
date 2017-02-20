class AddUserToFavoriteGif < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorite_gifs, :user, foreign_key: true
  end
end
