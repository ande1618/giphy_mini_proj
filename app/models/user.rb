class User < ActiveRecord::Base
  has_many :favorites
  has_many :favorite_gifs, through: :favorites, source: :favorited, source_type: 'Gif'
  has_secure_password
end
