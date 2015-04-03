class MentorsController < ApplicationController

  def index
    @mentors = Mentor.paginate(page: params[:page], per_page: 10)
    authorize @mentors
  end

  def new
    @mentor = Mentor.new
    @job = Job.find(params[:job_id])
    @category = @job.category.id
    authorize @mentor

    add_breadcrumb "Home", mentors_path
    add_breadcrumb @job.category.title, category_path(@category)
    add_breadcrumb @job.name, category_job_path(@category, @job)
  end

  def create
     @mentor = Mentor.new(params.require(:mentor).permit(:description, :user_id, :job_id))
     authorize @mentor

     if @mentor.save
       redirect_to @mentor, notice: "Mentorship opportunity was saved successfully."
     else
       flash[:error] = "Error creating mentorship opportunity. Please try again."
       render :new
     end
  end

  def show
    @mentor = Mentor.find(params[:id])
    @favorite = @mentor.favorites.where(user_id: current_user.id).first
    @new_favorite = Favorite.new
    authorize @mentor
  end

  def edit
    @mentor = Mentor.find(params[:id])
    authorize @mentor

    add_breadcrumb @mentor.description, mentor_path(@mentor)
  end

   def update
     @mentor = Mentor.find(params[:id])
     authorize @mentor
     if @mentor.update_attributes(params.require(:mentor).permit(:description))
       redirect_to @mentor
     else
       flash[:error] = "Error saving mentorship opportunity. Please try again"
       render :edit
     end
  end
 
   def destroy
     @mentor = Mentor.find(params[:id])
     authorize @mentor
 
     if @mentor.destroy
       flash[:notice] = "Mentorship was deleted successfully."
       redirect_to mentors_path
     else
       flash[:error] = "There was an error deleting the mentorship."
       render :show
     end
   end
end