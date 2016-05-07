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
        @notes=Note.where(user_id: current_user.id)
        @epreuve_list =[]
        @notes.each do |note|
           tmp = Epreuve.find(note.epreuve_id)
           @epreuve_list.push(tmp)
        end
            
    end


    private

    def epreuve_params
        params.require(:epreuve).permit(:titre, :date, :matiere_id)
    end
end
