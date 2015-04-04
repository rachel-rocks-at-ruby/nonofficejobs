class ResourcesController < ApplicationController
	def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

   def update
     @resouce = Resource.find(params[:id])

     if @resource.update_attributes(resource_params)
       redirect_to @resource, notice: "Resource was updated successfully."
     else
       flash[:error] = "Error saving resource. Please try again"
       render :edit
     end
   end

  def new
    @resource = Resource.new
    #@job = Job.find(params[:job_id])
  end

  def create
   @resource = Resource.new(resource_params)
   @resource.user = current_user

   if @resource.save
     redirect_to @resource, notice: "Resource was saved successfully."
   else
     flash[:error] = "Error creating resource. Please try again."
     render :new
   end
 end

  def destroy
     @resource = Resource.find(params[:id])
 
     if @resource.destroy
       flash[:notice] = "Resource was deleted successfully."
       redirect_to brainstorms_path
     else
       flash[:error] = "There was an error deleting the resource."
       render :show
     end
  end

  private

  def resource_params
  	@job = Job.find(params[:job_id])
    params.require(:resource).permit(:title, :link, :body, :job_id)
  end
end