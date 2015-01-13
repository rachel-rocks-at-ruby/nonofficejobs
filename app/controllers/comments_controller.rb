class CommentsController < ApplicationController
  
  respond_to :html, :js
  
  def create
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    # authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "Comment failed to save."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@category, @post.job, @post] }
    end
  end

   def destroy
     @category = Category.find(params[:category_id])
     @job = Job.find(params[:job_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     # authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end

     respond_with(@comment) do |format|
       format.html { redirect_to [@category, @post.job, @post] }
     end
   end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end