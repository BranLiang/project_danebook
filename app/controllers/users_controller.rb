class UsersController < ApplicationController
  before_action :require_current_user!, only: [:update, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user && @user.update(white_list_params)
      flash[:success] = "Profile updated successfully!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Information is not valid"
      render :edit
    end
  end

  private
    def white_list_params
      params.require(:user).permit(:about_me)
    end
end
