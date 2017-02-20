class AddGifToFavoriteGif < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorite_gifs, :gif, foreign_key: true
  end
end
