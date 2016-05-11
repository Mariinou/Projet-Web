class NotesController < ApplicationController
    before_action :authenticate_user!
	load_and_authorize_resource

	def new
        @note = Note.new
        if not(params[:epreuve_id] == nil)
            @epreuve = params[:epreuve_id]
            @matiere_id = Epreuve.find(@epreuve).matiere_id
            @eleves = Matiere.find(@matiere_id).users
            @nb_eleves = @eleves.count
        end
    end

	def create
        @note = Note.new(note_params)
        if @note.save
            flash[:notice] = 'Note ajoutée avec succès'
            redirect_to new_epreuve_path
        else
            render :action => 'new'
        end
    end

	def index
        @note_list = Note.where(user_id: current_user.id)
	end

	def edit

	end

    def show

    end

	private

    def note_params
        params.require(:note).permit(:user_id, :note, :matiere_id, :epreuve_id)
    end
end
