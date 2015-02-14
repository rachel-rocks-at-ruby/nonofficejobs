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
    @friends = Friendship.where(user_id: @user.id)
    @friend = Friendship.where(user_id: @user.id).first
    @friend_if = Friendship.where(user_id: current_user.id).first
    @jobs = Job.where(user_id: @user.id)
    @job = Job.where(user_id: @user.id).first
    @posts = Post.where(user_id: @user.id)
    @post = Post.where(user_id: @user.id).first
    @comments = Comment.where(user_id: @user.id)
    @comment = Comment.where(user_id: @user.id).first
    @listings = Listing.where(user_id: @user.id)
    @listing = Listing.where(user_id: @user.id).first
    @brainstorms = Brainstorm.where(user_id: @user.id)
    @brainstorm = Brainstorm.where(user_id: @user.id).first
    @mentorships = Mentor.where(user_id: @user.id)
    @mentor = Mentor.where(user_id: @user.id).first
    @fav_jobs = Favorite.where(favorable_type: "Job", user_id: @user.id)
    @fav_job = Favorite.where(favorable_type: "Job", user_id: @user.id).first
    @fav_brainstorms = Favorite.where(favorable_type: "Brainstorm", user_id: @user.id)
    @fav_brainstorm = Favorite.where(favorable_type: "Brainstorm", user_id: @user.id).first
    @fav_mentors = Favorite.where(favorable_type: "Mentor", user_id: @user.id)
    @fav_mentor = Favorite.where(favorable_type: "Mentor", user_id: @user.id).first
    @fav_listings = Favorite.where(favorable_type: "Listing", user_id: @user.id)
    @fav_listing = Favorite.where(favorable_type: "Listing", user_id: @user.id).first
    authorize @user
  end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar, :location, :about, :aspirations)
   end
 end