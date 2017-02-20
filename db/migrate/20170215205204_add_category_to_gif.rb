class AddCategoryToGif < ActiveRecord::Migration[5.0]
  def change
    add_reference :gifs, :category, foreign_key: true
  end
end
