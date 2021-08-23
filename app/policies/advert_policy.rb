class AdvertPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: :published).or(scope.where(user_id: @user.try(:id)))
    end
  end

  def new?
    user_is_not_an_admin?
  end

  def create?
    user_is_not_an_admin?
  end

  def show?
    user_is_owner_of_record? || @record.published?
  end

  def moderate?
    user_is_owner_of_record? && user_is_not_an_admin?
  end

  def publish?
    user_is_owner_of_record? && user_is_not_an_admin?
  end

  def update?
    user_is_owner_of_record? && user_is_not_an_admin?
  end

  def destroy?
    user_is_owner_of_record?
  end

  private

  def user_is_not_an_admin?
    user.role.name != 'admin'
  end

  def user_is_owner_of_record?
    user == @record.user
  end
end
