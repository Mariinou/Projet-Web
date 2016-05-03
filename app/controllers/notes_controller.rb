class NotesController < ApplicationController
	before_action :authenticate_user!

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

	end

	def edit

	end

	private

    def note_params
        params.require(:note).permit(:user_id, :note)
    end
end