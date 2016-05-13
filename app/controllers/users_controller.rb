class UsersController < ApplicationController

	def index
        if params[:approved] == "false"
          @users = User.where(approved: false)
        else
          @users = User.all
        end
    end

    def edit

    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = 'Etudiant ajouté avec succès'
            # Tell the UserMailer to send a welcome email after save
            UserMailer.invitation_email(@user).deliver_now
            redirect_to epreuves_path
        end
    end

	private

    def user_params
        params.require(:user).permit(:nom, :prenom, :email, :type, :password, :approved)
    end

end
