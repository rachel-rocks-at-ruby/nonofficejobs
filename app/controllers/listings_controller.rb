class ListingsController < ApplicationController
    def index
    @listings = Listing.paginate(page: params[:page], per_page: 10)
    authorize @listings
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
    @favorite = @listing.favorites.where(user_id: current_user.id).first
    @new_favorite = Favorite.new
    authorize @listing

    add_breadcrumb "Home", :root_path
    add_breadcrumb "Listings", listings_path
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing

    add_breadcrumb "Home", :root_path
    add_breadcrumb @listing.title, listing_path(@listing)
  end

   def update
     @listing = Listing.find(params[:id])
     authorize @listing
     if @listing.update_attributes(listing_params)
       redirect_to [@listing]
     else
       flash[:error] = "Error saving listing. Please try again"
       render :edit
     end
   end

  def create
     @listing = Listing.new(listing_params)
     @listing.user = current_user
     authorize @listing
     if @listing.save
       redirect_to @listing, notice: "Job listing was saved successfully."
     else
       flash[:error] = "Error creating job listing. Please try again."
       render :new
     end
   end
 
   def destroy
     @listing = Listing.find(params[:id])
     title = @listing.title
     authorize @listing
 
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