class EpreuvesController < ApplicationController
	def new
		@epreuve = Epreuve.new
	end

	def create
        @epreuve = Epreuve.new(epreuve_params)
        if @epreuve.save
            flash[:notice] = 'Epreuve ajoutée avec succès'
            redirect_to new_matiere_path
        else
            render :action => 'new'
        end
    end

    def epreuve_params
        params.require(:epreuve).permit(:titre, :debut, :fin, :user_id)
    end
end
