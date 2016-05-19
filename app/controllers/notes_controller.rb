class NotesController < ApplicationController
  before_action :authenticate_user!
	load_and_authorize_resource

	def new
        if current_user.kind_of? Enseignant
          if not(params[:epreuve_id] == nil)
              @epreuve = params[:epreuve_id]
              @matiere_id = Epreuve.find(@epreuve).matiere_id
              @eleves = Matiere.find(@matiere_id).users
              @nb_eleves = @eleves.count
              @notestab = []
              @nb_eleves.times do
                  @notestab << Note.new
              end
          else
            flash[:alert] = 'Aucune épreuve sélectionnée'
            redirect_to root_path
          end
        else 
          flash[:alert] = 'Accès refusé !'
          redirect_to root_path
        end
    end

    def create
        if params.has_key?("note")
          @note = Note.create(params["note"].permit(:user_id, :matiere_id, :epreuve_id, :note))
          if (Note.where(user_id: @note.user_id).where(epreuve_id: @note.epreuve_id).count > 1)
            @epreuve_id = @note.epreuve_id
            @note.destroy
            flash[:alert] = 'Note déjà existante'
            redirect_to new_note_path({ :epreuve_id => @epreuve.id })
          else
            flash[:notice] = 'Note ajoutée avec succès'
            redirect_to epreuves_path
          end
        else
          @flag=true
          params["notes"].each do |note|
            if note["note"] != "" 
              @note = Note.create(note.permit(:user_id, :matiere_id, :epreuve_id, :note))
              if (Note.where(user_id: @note.user_id).where(epreuve_id: @note.epreuve_id).count > 1)
                @note.destroy
                @flag=false
              end
            end
          end
          if @flag == false
            flash[:alert] = 'Une note éxistait déjà !'
            redirect_to root_path
          else
            flash[:notice] = 'Notes ajoutées avec succès'
            redirect_to epreuves_path
          end
        end
    end

	def index
        if current_user.kind_of? Etudiant
          @note_list = Note.where(user_id: current_user.id)
        else 
          @matiere_list = Matiere.where(user_id: current_user.id)

          @note_list = []
          @matiere_list.each do |matiere|
            epreuves = Epreuve.where(matiere_id: matiere.id)
            epreuves.each do |epreuve|
              @note_list << Note.where(epreuve_id: epreuve.id)
            end
          end
        end
	end

	 def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        if @note.update_attributes(params["note"].permit(:user_id, :matiere_id, :epreuve_id, :note))
            flash[:notice] = 'Modification de la note effectuée avec succès'
            redirect_to notes_path
        else
            render :action => 'edit'
        end
    end

	private
end
