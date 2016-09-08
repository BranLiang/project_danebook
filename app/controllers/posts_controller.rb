class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(white_list_params)
    if @post.save
      flash[:success] = "Post is created successfully"
    else
      flash[:danger] = "Sorry, post is not created"
    end
    redirect_to timeline_path(current_user)
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if post && post.destroy
      flash[:success] = "Post has been deleted"
    else
      flash[:danger] = "Post can not be deleted"
    end
    redirect_to timeline_path(current_user)
  end

  private
    def white_list_params
      params.require(:post).permit(:body)
    end
end
