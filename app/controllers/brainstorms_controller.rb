class BrainstormsController < ApplicationController

  def index
    @brainstorms = Brainstorm.paginate(page: params[:page], per_page: 10)
    authorize @brainstorms
  end

  def show
    @brainstorm = Brainstorm.find(params[:id])
    @comment = Comment.new
    authorize @brainstorm
  end

  def edit
    @brainstorm = Brainstorm.find(params[:id])
    authorize @brainstorm

    add_breadcrumb "Home", :root_path
    add_breadcrumb @brainstorm.title, brainstorm_path(@brainstorm)
  end

   def update
     @brainstorm = Brainstorm.find(params[:id])
     authorize @brainstorm

     if @brainstorm.update_attributes(brainstorm_params)
       redirect_to @brainstorm, notice: "Brainstorm was updated successfully."
     else
       flash[:error] = "Error saving brainstorm. Please try again"
       render :edit
     end
   end

  def new
    @brainstorm = Brainstorm.new
    authorize @brainstorm
  end

  def create
   @brainstorm = Brainstorm.new(brainstorm_params)
   @brainstorm.user = current_user
   authorize @brainstorm

   if @brainstorm.save
     redirect_to @brainstorm, notice: "Brainstorm was saved successfully."
   else
     flash[:error] = "Error creating brainstorm. Please try again."
     render :new
   end
 end

  private

  def brainstorm_params
    params.require(:brainstorm).permit(:title, :description)
  end
end