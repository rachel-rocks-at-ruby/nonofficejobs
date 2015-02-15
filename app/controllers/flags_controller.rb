class FlagsController < ApplicationController
  def create
    @flag = Flag.new
    @flag.user = current_user

    if @flag.save
      flash[:notice] = "Flagged."
      redirect_to :back
    else
      flash[:error] = "Flag failed."
      redirect_to :back
    end
  end

  def destroy
    @flag = Flag.find(params[:id])
     
    if @flag.destroy
      flash[:notice] = "Unflagged."
      redirect_to :back
    else
      flash[:error] = "Failed to unflag."
      redirect_to :back
    end    
  end
end