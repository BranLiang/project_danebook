class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def timeline
    @post = Post.new
    @user = User.includes(:posts => [:likes => :user]).find_by_id(params[:id])
  end


end
