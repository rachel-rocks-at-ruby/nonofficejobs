class PostsController < ApplicationController
  def show
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @job = Job.find(params[:job_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.job = @job
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@job, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @job = Job.find(params[:job_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@job, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end