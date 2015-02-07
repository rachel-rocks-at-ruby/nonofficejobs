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
    @mentors = Mentor.all
    authorize @job

    add_breadcrumb "Home", :root_path
    add_breadcrumb @category.title, category_path(@category)
    add_breadcrumb @job.name
  end

  def edit
    @category = Category.find(params[:category_id])
    @job = Job.find(params[:id])
    authorize @job
  end

   def update
     @category = Category.find(params[:category_id])
     @job = Job.find(params[:id])
     authorize @job
     if @job.update_attributes(job_params)
       redirect_to [@category, @job]
     else
       flash[:error] = "Error saving job. Please try again"
       render :edit
     end
   end

  def create
     @category = Category.find(params[:category_id])
     @job = Job.new(job_params)
     @job.category = @category
     authorize @job
     if @job.save
       redirect_to [@category, @job], notice: "Job was saved successfully."
     else
       flash[:error] = "Error creating job. Please try again."
       render :new
     end
   end
 
   def destroy
     @category = Category.find(params[:category_id])
     @job = Job.find(params[:id])
     name = @job.name
     authorize @job
 
     if @job.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to @category
     else
       flash[:error] = "There was an error deleting the job."
       render :show
     end
   end

   private

   def job_params
     params.require(:job).permit(:name, :description, :public)
   end
end
