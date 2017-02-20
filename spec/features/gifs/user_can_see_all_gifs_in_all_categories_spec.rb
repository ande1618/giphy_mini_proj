require 'rails_helper'

  describe "User visits index page" do
    scenario "a user can see all gifs in all categories" do
      user = User.create!(username: "RegUser", password: "password")
      category_1 = Category.create!(title: "Entertainment")
      category_2 = Category.create!(title: "Sports")
      gif_1 = category_1.gifs.create!(image_path: "http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0")
      gif_2 = category_2.gifs.create!(image_path: "http://i.giphy.com/3o6wrHa70C3Wrj5QeA.gif")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


      visit gifs_path

      expect(page).to have_xpath("//img[@src='http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0']")
      expect(page).to have_xpath("//img[@src='http://i.giphy.com/3o6wrHa70C3Wrj5QeA.gif']")

    end
  end
