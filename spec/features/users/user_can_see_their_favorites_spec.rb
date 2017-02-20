require 'rails_helper'

RSpec.feature "User can see their favorites list" do
  context "Authorized user" do
    scenario "they see their favorites" do
      user = User.create!(username: "RegUser", password: "password")
      category = Category.create(title: "Entertainment")
      gif_1 = category.gifs.create!(image_path: "http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0")
      gif_2 = category.gifs.create!(image_path: "http://i.giphy.com/3o6wrHa70C3Wrj5QeA.gif")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      click_on("Add to favorites", match: :first)

      visit user_favorite_gifs_path(user)

      expect(page).to have_xpath("//img[@src='http://giphy.com/gifs/fallontonight-yes-tonight-show-3o6Ygq32TrPVLwcbm0']")

    end
  end
end
