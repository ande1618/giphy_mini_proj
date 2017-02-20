require 'rails_helper'

  describe "User visits categories index" do
    context "As an Admin" do
      scenario "They can click on the new gif button" do
        admin = User.create(username: "AdminUser", password: "password", role: 1)
        category = Category.create!(title: "Food")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit gifs_path

        click_on "Create a Gif"

        select('Food', from: "category[category_id]")
        fill_in "search", with: "french fries"
        # fill_in "image_path", with: "http://i.giphy.com/3o6Ygq32TrPVLwcbm0.gif"
        click_on "Generate Gif"

        # expect(page).to have_xpath("//img[@src='http://i.giphy.com/3o6Ygq32TrPVLwcbm0.gif']")
        expect(page).to have_css("ul li", count: + 3)

      end
    end

    context "As a RegUser" do
      scenario "They can click on the new gif button" do
        user = User.create(username: "RegUser", password: "password", role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit gifs_path

        click_on "Create a Gif"

        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
