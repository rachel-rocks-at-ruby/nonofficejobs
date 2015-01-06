 class JobPolicy < ApplicationPolicy
 
   def index?
     true
   end
 
   def create?
     user.present?
   end
 
   def update?
     user.present? && (user.admin? || user.moderator?)
   end
 end