class ListingsController < ApplicationController
    def index
    @listings = Listing.paginate(page: params[:page], per_page: 10)
    # authorize @jobs
  end

  def new
    #@category = Category.find(params[:category_id])
    @listing = Listing.new
    #authorize @job
  end

  def show
    #@category = Category.find(params[:category_id])
    @listing = Listing.find(params[:id])
    #authorize @job
  end

  def edit
    #@category = Category.find(params[:category_id])
    @listing = Listing.find(params[:id])
    #authorize @job
  end

   def update
     #@category = Category.find(params[:category_id])
     @listing = Listing.find(params[:id])
     #authorize @job
     if @listing.update_attributes(listing_params)
       redirect_to [@listing]
     else
       flash[:error] = "Error saving listing. Please try again"
       render :edit
     end
   end

  def create
     @listing = Listing.new(listing_params)
     #authorize @job
     if @listing.save
       redirect_to [@listing], notice: "Job listing was saved successfully."
     else
       flash[:error] = "Error creating job listing. Please try again."
       render :new
     end
   end
 
   def destroy
     #@category = Category.find(params[:category_id])
     @listng = Listing.find(params[:id])
     title = @listing.title
     #authorize @job
 
     if @listing.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to @category
     else
       flash[:error] = "There was an error deleting \"#{title}\"."
       render :show
     end
   end

   private

  def listing_params
    params.require(:listing).permit(:title, :location, :description, :pay, :compensation)
  end
end