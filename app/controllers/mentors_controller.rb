class MentorsController < ApplicationController

  def index
    @mentors = Mentor.paginate(page: params[:page], per_page: 10)
    authorize @mentors
  end

  def new
    @mentor = Mentor.new
    # authorize @category
  end

  def show
    @mentor = Mentor.find(params[:id])
    @job = Job.find(params[:job_id])
    # authorize @category
  end

  def edit
    @mentor = Mentor.find(params[:id])
    # authorize @category
  end

   def update
     @mentor = Mentor.find(params[:id])
     # authorize @category
     if @mentor.update_attributes(params.require(:mentor).permit(:description))
       redirect_to @mentor
     else
       flash[:error] = "Error saving mentorship opportunity. Please try again"
       render :edit
     end
  end

  def create
     @mentor = Mentor.new(params.require(:mentor).permit(:description))
     # authorize @category

     if @mentor.save
       redirect_to @category, notice: "Mentorship opportunity was saved successfully."
     else
       flash[:error] = "Error creating mentorship opportunity. Please try again."
       render :new
     end
   end
 
  #  def destroy
  #    @category = Category.find(params[:id])
  #    title = @category.title
 
  #    if @category.destroy
  #      flash[:notice] = "\"#{title}\" was deleted successfully."
  #      redirect_to categories_path
  #    else
  #      flash[:error] = "There was an error deleting the category."
  #      render :show
  #    end
  #  end
end