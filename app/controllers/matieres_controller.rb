class MatieresController < ApplicationController
	def new
		@matiere = Matiere.new
	end

	def create
        @matiere = Matiere.new(matiere_params)
        if @matiere.save
            flash[:notice] = 'Matière ajoutée avec succès'
            redirect_to new_matiere_path
        else
            render :action => 'new'
        end
    end

    def index
    	@matiere_list = Matiere.all
    end

    private

    def matiere_params
        params.require(:matiere).permit(:titre, :debut, :fin, :user_id)
    end
end
