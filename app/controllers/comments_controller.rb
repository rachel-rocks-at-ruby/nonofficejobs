class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    # authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@post.job, @post]
    else
      flash[:error] = "Comment failed to save."
    end

    # respond_with(@comment) do |format|
    #   format.html { redirect_to [@post.job, @post] }
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end