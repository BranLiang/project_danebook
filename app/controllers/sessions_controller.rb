class SessionsController < ApplicationController

  def create
    store_referer
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      permanent_sign_in(@user)
      flash[:success] = ["You've successfully signed in"]
      redirect_to signup_path
    else
      flash[:danger] = @user.nil? ? ["User could not be found"] : @user.errors.full_messages
      redirect_to referer
    end
  end

  def destroy
    store_referer
    sign_out
    flash[:success] = ["You've successfully signed out"]
    redirect_to referer
  end
end