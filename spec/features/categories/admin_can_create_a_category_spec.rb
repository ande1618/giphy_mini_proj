require 'rails_helper'

  describe "User visits categories index" do
    context "As an Admin" do
      scenario "They can click on the new category button and create a gif" do
        admin = User.create!(username: "AdminUser", password: "password", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit categories_path

        click_on "Create a Category"

        fill_in "category[title]", with: "Sports"
        click_on "Create Category"

        expect(current_path).to eq(categories_path)
        expect(page).to have_content("Sports")

      end
    end

    context "As a RegUser" do
      scenario "They cannot create a new gif" do
        user = User.create(username: "RegUser", password: "password", role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit categories_path

        click_on "Create a Category"

        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
