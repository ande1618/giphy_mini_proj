require 'rails_helper'

  describe "User sees a gif" do
    scenario "a user can view a gif" do

      user = User.create!(username: "RegUser", password: "password")
      category = Category.create!(title: "Sports")
      gif = category.gifs.create!(image_path: "http://i.giphy.com/3o6Ygq32TrPVLwcbm0.gif")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_gif_path(category, gif)

      expect(page).to have_xpath("//img[@src='http://i.giphy.com/3o6Ygq32TrPVLwcbm0.gif']")

    end
  end
