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

    def index
    	@matiere_list = Matiere.all
    end

    private

    def matiere_params
        params.require(:matiere).permit(:titre, :debut, :fin, :user_id)
    end
end
