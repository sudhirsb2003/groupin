class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
   if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, EventAttendence
      can :event_attendence, Event
      #can :update, Event
    end
  end
end
