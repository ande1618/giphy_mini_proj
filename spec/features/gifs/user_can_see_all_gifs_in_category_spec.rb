require 'rails_helper'

  describe "User sees a category of gifs" do
    scenario "a user can view all gifs for that category" do
      user = User.create!(username: "RegUser", password: "password")
      category = Category.create!(title: "Sports")
      gif_1 = category.gifs.create!(image_path: "http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0")
      gif_2 = category.gifs.create!(image_path: "http://i.giphy.com/3o6wrHa70C3Wrj5QeA.gif")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_gifs_path(category.id)

      expect(page).to have_xpath("//img[@src='http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0']")
      expect(page).to have_xpath("//img[@src='http://i.giphy.com/3o6wrHa70C3Wrj5QeA.gif']")

    end
  end
