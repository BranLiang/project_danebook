class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(white_list_params)
    if comment.save
      flash[:success] = "Comment is created"
    else
      flash[:danger] = "Your comment is not successfull"
    end
    redirect_back(fallback_location: fallback_location)
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    if comment && comment.destroy
      flash[:success] = "Coments has been deleted"
    else
      flash[:danger] = "You can not delete this comment"
    end
    redirect_back(fallback_location: fallback_location)
  end

  private
    def white_list_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
end
