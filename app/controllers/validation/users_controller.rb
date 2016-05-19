class Validation::UsersController < ApplicationController
    before_action :authenticate_user!
    before_filter :verify_user
   
	def index
        if params[:approved] == "false"
          @users = User.where(approved: false)
          @enseignants = User.where(type: Enseignant).where(approved: false)
        else
          @users = User.all
          @enseignants = User.where(type: Enseignant)
        end
        @etudiants = User.where(type: Etudiant)
    end

    def edit
        @user = User.find(params[:id]).becomes(User)
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:notice] = 'Mise à jour de l\' enseignant effectuée avec succès'
            redirect_to validation_users_path
        else
            @user=@user.becomes(User)
            render :action => 'edit'
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.password= Devise.friendly_token.first(8)
        if @user.save
            flash[:notice] = 'Etudiant ajouté avec succès'
            # Tell the UserMailer to send a welcome email after save
            UserMailer.invitation_email(@user).deliver_now
            redirect_to validation_users_path
        end
    end

	private

    def user_params
        params.require(:user).permit(:nom, :prenom, :email, :type, :password, :approved)
    end

    def verify_user
        if current_user.kind_of? Etudiant
            redirect_to root_url
            flash[:alert] = "Accès refusé !"
        end
    end 

end