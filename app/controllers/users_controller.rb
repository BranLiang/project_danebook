class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user && @user.update(:about_me => params[:about_me])
      flash[:success] = "Profile updated successfully!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Information is not valid"
      render :edit
    end
  end
end
