class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    @listings = Listing.where(user_id: @user.id)
    @brainstorms = Brainstorm.where(user_id: @user.id)
    @mentorships = Mentor.where(user_id: @user.id)
    authorize @user
  end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar, :location, :about, :aspirations)
   end
 end