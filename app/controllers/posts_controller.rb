class PostsController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    @flag = @job
    @comments = @post.comments
    @comment = Comment.new
    authorize @post

    add_breadcrumb "Home", categories_path
    add_breadcrumb "Category: #{@category.title}", category_path(@category)
    add_breadcrumb "Job: #{@job.name}", category_job_path(@category, @job)
    add_breadcrumb "Post: #{@post.title}"
  end

  def new
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = Post.new
    authorize @post

    add_breadcrumb "Home", categories_path
    add_breadcrumb "Category: #{@category.title}", category_path(@category)
    add_breadcrumb "Job: #{@job.name}", category_job_path(@category, @job)
  end

  def edit
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    authorize @post

    add_breadcrumb "Home", categories_path
    add_breadcrumb "Category: #{@category.title}", category_path(@category)
    add_breadcrumb "Job: #{@job.name}", category_job_path(@category, @job)
    add_breadcrumb "Post: #{@post.title}", category_job_post_path(@category, @job, @post)
  end

  def update
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@category, @job, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = current_user.posts.build(post_params)
    @post.job = @job
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@category, @job, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    @post.job = @job
    title = @post.title
    authorize @post
 
     if @post.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to @job
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end