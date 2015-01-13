class BrainstormsController < ApplicationController

  def index
    @brainstorms = Brainstorm.paginate(page: params[:page], per_page: 10)
    authorize @brainstorms
  end

  def show
    @brainstorm = Brainstorm.find(params[:id])
  end

  def edit
    @brainstorm = Brainstorm.find(params[:id])
  end

   def update
     @brainstorm = Brainstorm.find(params[:id])

     if @brainstorm.update_attributes(brainstorm_params)
       redirect_to @brainstorm, notice: "Brainstorm was updated successfully."
     else
       flash[:error] = "Error saving brainstorm. Please try again"
       render :edit
     end
   end

  def new
    @brainstorm = Brainstorm.new
  end

  def create
   @brainstorm = Brainstorm.new(brainstorm_params)
   # authorize @category

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