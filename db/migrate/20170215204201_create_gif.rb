class CreateGif < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :image_path
      t.string :hit_words
    end
  end
end
