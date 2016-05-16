class MatieresController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
	def new
		@matiere = Matiere.new
	end

	def create
        @matiere = Matiere.new(matiere_params)
        @matiere.user_id = current_user.id
        if @matiere.save
            flash[:notice] = "Matière #{@matiere.titre} ajoutée avec succès"
            redirect_to new_matiere_path
        else
            render :action => 'new'
        end
    end

    def newmatels
      params["matels"].each do |matel|
        if matel["user_id"] != "" 
          UsersMatiere.create(matel.permit(:user_id, :matiere_id))
        end
      end
      flash[:notice] = 'Elèves inscrits avec succès'
      redirect_to matieres_path
    end

    def index
    	@matiere_list = Matiere.all
        if not(current_user.kind_of? Etudiant)
          if not(params[:matiere_id] == nil)
              @matiere = Matiere.find(params[:matiere_id])
              @etudiant_list = User.where(type: Etudiant)
              @nb_eleves = @etudiant_list.count
              @mateltab = []
              @nb_eleves.times do
                  @mateltab << UsersMatiere.new
              end
          end
        end
    end

    private

    def matiere_params
        params.require(:matiere).permit(:titre, :debut, :fin, :user_id)
    end
end
