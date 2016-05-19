class EpreuvesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
	def new
		@epreuve = Epreuve.new
	end

	def create
        @epreuve = Epreuve.new(epreuve_params)
        if @epreuve.save
            flash[:notice] = "Epreuve #{@epreuve.titre} ajoutée avec succès"
            redirect_to epreuves_path
        else
            render :action => 'new'
        end
    end

    def index
        if current_user.kind_of? Etudiant
            @epreuve_list =[]
            @matieres=current_user.matieres
            @matieres.each do |matiere|
                @i = 0
                tmp = Epreuve.where(matiere_id: matiere.id)
                while not(tmp[@i] == nil) do
                    @epreuve_list.push(tmp[@i])
                    @i = @i+1
                end
            end
        else 
            @matieres = Matiere.where(user_id: current_user.id)
            @epreuve_list =[]
            @matieres.each do |matiere|
               @i = 0
               tmp = Epreuve.where(matiere_id: matiere.id)
               while not(tmp[@i] == nil) do
                    @epreuve_list.push(tmp[@i])
                    @i = @i+1
               end
            end
        end
            
    end


    private

    def epreuve_params
        params.require(:epreuve).permit(:titre, :date, :matiere_id)
    end
end
