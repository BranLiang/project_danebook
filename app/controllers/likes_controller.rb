class LikesController < ApplicationController
  def create
    like = current_user.likes.build(likeable_type: params[:type],
                                    likeable_id: params[:id])
    if like.save
      flash[:success] = "Great! You like it."
    else
      flash[:danger] = "You already liked it."
    end
    redirect_back(fallback_location: fallback_location)
  end

  def destroy
    like = current_user.likes.find_by(likeable_type: params[:type],
                                      likeable_id: params[:id])
    if like && like.destroy
      flash[:success] = "Unlike Mother fucker"
      redirect_back(fallback_location: fallback_location)
    end
  end
end
