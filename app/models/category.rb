class Category < ActiveRecord::Base
  has_many :gifs, dependent: :destroy

end
