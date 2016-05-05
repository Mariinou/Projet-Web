class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
  	if user.kind_of? Administrateur
  		can :manage, :all

  	else if user.kind_of? Etudiant
  		can :read, Note
  		can :read, Epreuve
  	else 
  		can :manage, Note
  		can :manage, Matiere
  		can :manage, Epreuve
  		can :manage, Etudiant

  	end
  	end
  end
end
