class BrainstormsController < ApplicationController

  def index
    @brainstorms = Brainstorm.paginate(page: params[:page], per_page: 10)
    authorize @brainstorms
  end

  def show
    @brainstorm = Brainstorm.find(params[:id])
    @flag = Flag.where(comment_id: comment.id)
    @comment = Comment.new
    @comments = @brainstorm.comments
    @favorite = @brainstorm.favorites.where(user_id: current_user.id).first if current_user
    @new_favorite = Favorite.new
    authorize @brainstorm

    add_breadcrumb "Brainstorms", brainstorms_path
  end

  def edit
    @brainstorm = Brainstorm.find(params[:id])
    authorize @brainstorm

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
    @category = Category.find(params[:category_id]) if params[:category_id]
    authorize @brainstorm

    add_breadcrumb @category.title, @category if @category
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
    params.require(:brainstorm).permit(:title, :description, :category_id)
  end
end