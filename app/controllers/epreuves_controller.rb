class EpreuvesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
	def new
		@epreuve = Epreuve.new
	end

	def create
        @epreuve = Epreuve.new(epreuve_params)
        if @epreuve.save
            flash[:notice] = 'Epreuve ajoutée avec succès'
            redirect_to new_epreuve_path
        else
            render :action => 'new'
        end
    end

    def index
        if current_user.kind_of? Etudiant
            @epreuve_list =[]
            @matieres=current_user.matieres
            @matieres.each do |matiere|
                tmp = Epreuve.where(matiere_id: matiere.id)
                if not(tmp.empty?)
                    @epreuve_list.push(tmp[0])
                end
            end
        else 
            @notes=Note.where(user_id: current_user.id)
            @epreuve_list =[]
            @notes.each do |note|
               tmp = Epreuve.find(note.epreuve_id)
               @epreuve_list.push(tmp)
            end
        end
            
    end


    private

    def epreuve_params
        params.require(:epreuve).permit(:titre, :date, :matiere_id)
    end
end
