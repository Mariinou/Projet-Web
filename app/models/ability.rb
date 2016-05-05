class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
  	if user.kind_of? Administrateur
  		can :manage, :all

  	else if user.kind_of? Etudiant
  		can :read, Note
  	else 
  		can :create, Note
  		can :create, Matiere
  		can :create, Epreuve
  	end
  	end
  end
end
