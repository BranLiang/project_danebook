require 'rails_helper'

feature 'Post' do
  before do
    visit root_path
    user = create(:user)
    sign_in(user)
    click_link("Timeline")
  end

  scenario 'make a post' do
    fill_in "post_body", with: "Hello world"
    click_button "Post Confirm"
    expect(page).to have_content("Hello world")
  end

  scenario 'like/unlike a post' do
    fill_in "post_body", with: "Hello world"
    click_button "Post Confirm"
    click_link 'Like'
    expect(page).to have_content("Unlike")
    click_link 'Unlike'
    expect(page).to have_content("Like")
  end

  scenario 'edit about' do
    within '.top-nav' do
      click_link 'About'
    end
    click_link 'Edit Profile'
    fill_in 'user_about_me', with: "this is me"
    click_button "Confirm"
    expect(page).to have_content("this is me")
  end
end
