class ListingsController < ApplicationController
    def index
    @listings = Listing.paginate(page: params[:page], per_page: 10)
    authorize @listings
  end

  def new
    @listing = Listing.new
    #authorize @job
  end

  def show
    @listing = Listing.find(params[:id])
    #authorize @job
  end

  def edit
    @listing = Listing.find(params[:id])
    #authorize @job
  end

   def update
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
     @listing = Listing.find(params[:id])
     title = @listing.title
     #authorize @job
 
     if @listing.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to listings_path
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