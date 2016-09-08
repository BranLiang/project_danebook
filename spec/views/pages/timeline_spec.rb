require 'rails_helper'

describe "pages/timeline.html.erb" do
  before do
    user = create(:user)
    comment = build(:comment)
    post = build(:comment)
    assign(:user, user)
    assign(:comment, comment)
    assign(:post, post)
  end

  # it "shows the new post form" do
  #   render
  # end
end
