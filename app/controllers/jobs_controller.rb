class JobsController < ApplicationController
  def index
    @jobs = Job.paginate(page: params[:page], per_page: 10)
    authorize @jobs
  end

  def new
    @job = Job.new
    authorize @job
  end

  def show
    @job = Job.find(params[:id])
    @posts = @job.posts.paginate(page: params[:page], per_page: 10)
    authorize @job
  end

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def create
     @job = Job.new(params.require(:job).permit(:name, :description, :public))
     authorize @job
     if @job.save
       redirect_to @job, notice: "Job was saved successfully."
     else
       flash[:error] = "Error creating job. Please try again."
       render :new
     end
   end
 
   def update
     @job = Job.find(params[:id])
     authorize @job
     if @job.update_attributes(params.require(:job).permit(:name, :description, :public))
       redirect_to @job
     else
       flash[:error] = "Error saving job. Please try again"
       render :edit
     end
   end
end
