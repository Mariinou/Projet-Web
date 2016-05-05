class NotesController < ApplicationController
    before_action :authenticate_user!
	load_and_authorize_resource

	def new
		@note = Note.new
	end

	def create
        @note = Note.new(note_params)
        if @note.save
            flash[:notice] = 'Note ajoutée avec succès'
            redirect_to new_note_path
        else
            render :action => 'new'
        end
    end

	def index
        @note_list = Note.all
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
