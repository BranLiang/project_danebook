require 'rails_helper'

feature 'User accounts' do
  before do
    visit root_path
  end

  scenario "add a new user" do
    within(".home-page") do
      fill_in "Username", with: "test_name"
      fill_in "Email",    with: "test@email.com"
      fill_in "Password", with: "foobar"
      fill_in "Password confirmation", with: "foobar"
    end

    expect{ click_button "Sign up" }.to change(User, :count).by(1)
  end

  scenario "sign in a user" do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content user.username
  end

  scenario "sign out a user" do
    user = create(:user)
    sign_in(user)
    click_link "Timeline"
    sign_out
    expect(page).to have_content "Hello, world!"
  end
end
