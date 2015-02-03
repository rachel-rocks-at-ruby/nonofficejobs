class MentorPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end