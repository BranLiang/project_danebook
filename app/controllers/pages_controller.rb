class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
  end

  def timeline
    @user = User.find_by_id(params[:id])
  end


end
