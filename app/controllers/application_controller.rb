class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    after_filter :store_location

    rescue_from ActionController::RoutingError do |exception|
           render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found
    end

    rescue_from CanCan::AccessDenied do |exception|
        flash[:alert] = "Accès refusé !"
        redirect_to root_path
    end

    def store_location
        # store last url - this is needed for post-login redirect to whatever the user last visited.
        return unless request.get?
        if (request.path != "/users/sign_in" &&
            request.path != "/users/sign_up" &&
            request.path != "/users/password/new" &&
            request.path != "/users/password/edit" &&
            request.path != "/users/confirmation" &&
            request.path != "/users/sign_out" &&
            !request.xhr?) # don't store ajax calls
            session[:previous_url] = request.fullpath
        end
    end

    def after_sign_up_path_for(resource)
        redirect_to users_index_path
    end

    #les méthodes définies si dessous sont protégées et ne peuvent pas être modifiées dans les controlleurs
    protected


    # Fonction custom pour savoir si un user est de type Administrateur
    def admin?
        if current_user.kind_of? Administrateur
            true
        else
            false
        end
    end

    def enseignant?
        if current_user.kind_of? Enseignant
            true
        else
            false
        end
            
    end

    def etudiant?
        if current_user.kind_of? Etudiant
            true
        else
            false
        end
    end
end
