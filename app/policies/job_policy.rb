class JobPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end
end