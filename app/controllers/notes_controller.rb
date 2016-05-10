class NotesController < ApplicationController
    before_action :authenticate_user!
	load_and_authorize_resource

	def new
        @kennel = []
        5.times do
            @kennel << Note.new
        end
    end

	def create
        params["notes"].each do |note|
        if @note.save
            flash[:notice] = 'Note ajoutée avec succès'
            redirect_to new_note_path
        else
            render :action => 'new'
        end
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
