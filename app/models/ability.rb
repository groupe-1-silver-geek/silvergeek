# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user.admin? || user.partner_id.present?
    can :manage, Device
    can :manage, Game
    if user.admin?
      can :manage, :all
    else
      # User with partner id
      cannot :destroy, Device
      cannot :destroy, Game
      can :manage, Partner, id: user.partner_id
      can :manage, Structure, partner_id: user.partner_id
      can :manage, Senior, structure_id: managed_structure_ids(user)
      can :manage, Activity, structure_id: managed_structure_ids(user)
      can :manage, Participation, activity_id: Activity.where(structure_id: managed_structure_ids(user)).pluck(:id)
    end
  end

  protected

  def managed_structure_ids(user)
    Structure.where(partner_id: user.partner_id).pluck(:id)
  end
end
