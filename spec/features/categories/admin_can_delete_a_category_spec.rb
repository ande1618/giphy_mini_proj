require 'rails_helper'

describe "User visits categories index" do
  context "As an Admin" do
    scenario "They can click on the delete category button" do
      category = Category.create!(title: "Food")
      admin = User.create!(username: "AdminUser", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path

      within("li:nth-child(3)") do
        click_on("Delete").first
      end
      expect(page).to have_content("Food was successfully deleted!")

    end
  end
  context "As a User" do
    scenario "They can click on the delete category button" do
      user = User.create(username: "RegUser", password: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path

      click_on("Delete", match: :first)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
