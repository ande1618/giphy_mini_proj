require 'rails_helper'

RSpec.feature "User tries to log in" do
  scenario "with valid credentials" do
    user = User.create(username: "RegUser", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path

    expect(page).to have_content("Welcome, please log in below")

    fill_in "session[username]", with: "RegUser"
    fill_in "session[password]", with: "password"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    within("h1.greeting") do
      expect(page).to have_content("Welcome RegUser")
    end
    within("div.favorites") do
      expect(page).to have_button("My Favorites")
    end
  end

  scenario "with invalid credentials" do
    user = User.create(username: "RegUser", password: "password")

    visit login_path

    expect(page).to have_content("Welcome, please log in below")

    fill_in "session[username]", with: "RegUser"
    fill_in "session[password]", with: "notthepassword"
    click_on "Log In"

    expect(current_path).to eq(login_path)

    within(".flash_notice") do
      expect(page).to have_content("Wrong username and/or password")
    end
  end
end
