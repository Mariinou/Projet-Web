class HomeController < ApplicationController

    before_action :authenticate_user!
    load_and_authorize_resource :only => [:home]
	
	def index
		if current_user.kind_of? Etudiant
           	@type = Etudiant
        else if current_user.kind_of? Enseignant
            @type = Enseignant
        else 
        	@type = Administrateur
        end
    	end
	end
end