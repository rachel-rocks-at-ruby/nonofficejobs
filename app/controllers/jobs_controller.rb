class JobsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @jobs = Job.paginate(page: params[:page], per_page: 10)
    authorize @jobs
  end

  def new
    @category = Category.find(params[:category_id])
    @job = Job.new
    authorize @job
  end

  def show
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:id])
    @posts = @job.posts.paginate(page: params[:page], per_page: 10)
    authorize @job
  end

  def edit
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:id])
    authorize @job
  end

  def create
     @category = Category.find(params[:category_id])
     @job = Job.new(params.require(:job).permit(:name, :description, :public))
     authorize @job
     if @job.save
       redirect_to [@category, @job], notice: "Job was saved successfully."
     else
       flash[:error] = "Error creating job. Please try again."
       render :new
     end
   end
 
   def update
     @category = Category.find(params[:category_id])
     @job = Job.find(params[:id])
     authorize @job
     if @job.update_attributes(params.require(:job).permit(:name, :description, :public))
       redirect_to [@category, @job]
     else
       flash[:error] = "Error saving job. Please try again"
       render :edit
     end
   end
end
