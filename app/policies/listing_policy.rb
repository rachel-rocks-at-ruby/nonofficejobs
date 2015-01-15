class ListingPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end