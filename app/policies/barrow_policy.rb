class BarrowPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end
  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  def booking?
    true
  end

  def my_barrows?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end
end
