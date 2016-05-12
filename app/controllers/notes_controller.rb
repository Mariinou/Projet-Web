class NotesController < ApplicationController
    before_action :authenticate_user!
	load_and_authorize_resource

	def new
        if not(params[:epreuve_id] == nil)
            @epreuve = params[:epreuve_id]
            @matiere_id = Epreuve.find(@epreuve).matiere_id
            @eleves = Matiere.find(@matiere_id).users
            @nb_eleves = @eleves.count
            @kennel = []
            @nb_eleves.times do
                @kennel << Note.new
            end
        end
    end

    def create
        if params.has_key?("note")
          Note.create(params["note"].permit(:user_id, :matiere_id, :epreuve_id, :note))
          flash[:notice] = 'Note ajoutée avec succès'
          redirect_to epreuves_path
        else
          params["notes"].each do |note|
            if note["note"] != "" 
              Note.create(note.permit(:user_id, :matiere_id, :epreuve_id, :note))
            end
          end
          flash[:notice] = 'Notes ajoutées avec succès'
          redirect_to epreuves_path
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
end
