require 'rails_helper'

feature 'Comment' do
  before do
    visit root_path
    user = create(:user)
    sign_in(user)
    click_link("Timeline")
    fill_in "post_body", with: "Hello world"
    click_button "Post Confirm"
  end

  # scenario 'make a comment' do
  #   fill_in 'comment_body', with: "comment test area"
  #   click_button "Make a comment"
  #   expect(page).to have_content("comment test area")
  # end
end
