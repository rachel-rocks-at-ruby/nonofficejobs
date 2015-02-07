class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
    authorize @categories
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @category = Category.find(params[:id])
    @jobs = @category.jobs.paginate(page: params[:page], per_page: 10)
    @listings = Listing.all

    add_breadcrumb "Home", :root_path
    add_breadcrumb "Category"
    
    authorize @category
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category

    add_breadcrumb "Home", :root_path
    add_breadcrumb @category.title, @category
  end

   def update
     @category = Category.find(params[:id])
     authorize @category
     if @category.update_attributes(params.require(:category).permit(:title))
       redirect_to @category
     else
       flash[:error] = "Error saving category. Please try again"
       render :edit
     end
   end

  def create
     @category = Category.new(params.require(:category).permit(:title))
     authorize @category

     if @category.save
       redirect_to @category, notice: "Category was saved successfully."
     else
       flash[:error] = "Error creating category. Please try again."
       render :new
     end
   end
 
   def destroy
     @category = Category.find(params[:id])
     title = @category.title
 
     #authorize @topic
     if @category.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to categories_path
     else
       flash[:error] = "There was an error deleting the category."
       render :show
     end
   end

end
